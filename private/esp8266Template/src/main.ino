#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <StringSplitter.h>

WiFiClient espClient;
PubSubClient mqttClient(espClient);

#define DEBUG_SERIAL true

char clientName[50];

long lastMsg = 0;
long readDelay = {{readDelay}};

char msg[150];
char topic[100];

{{vars}}
{{funcs}}

void setup() {
  #ifdef DEBUG_SERIAL
    Serial.begin(115200);
    Serial.println();
    Serial.printf("ESP8266 Chip id = %08X\n", ESP.getChipId());
  #endif
  snprintf(clientName, 50, "esp8266-%08X", ESP.getChipId());

  setup_wifi();

  mqttClient.setServer("{{mqttServerIP}}", {{mqttServerPort}});
  mqttClient.setCallback(mqttCallback);

  {{setupInject}}
}

void setup_wifi() {

  delay(10);
  #ifdef DEBUG_SERIAL
    Serial.println();
    Serial.print("Connecting to ");
    Serial.println("{{ssid}}");
  #endif

  WiFi.begin("{{ssid}}", "{{password}}");
  WiFi.mode(WIFI_STA);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    #ifdef DEBUG_SERIAL
      Serial.print(".");
    #endif
  }

  #ifdef DEBUG_SERIAL
    Serial.println("");
    Serial.println("WiFi connected");
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());
  #endif
}

void mqttCallback(char* topic, byte* payload, unsigned int length) {
  #ifdef DEBUG_SERIAL
    String message = "";

    for (int i = 0; i < length; i++) {
      message += (char)payload[i];
    }

    Serial.println("mqtt message:");
    Serial.println(topic);
    Serial.println(message);
  #endif

  StringSplitter *splitter = new StringSplitter(topic, '/', 20);
  int itemCount = splitter->getItemCount();

  #ifdef DEBUG_SERIAL
    for(int i = 0; i < itemCount; i++){
      String item = splitter->getItemAtIndex(i);
      Serial.println("Item @ index " + String(i) + ": " + String(item));
    }
  #endif

  {{mqttCallbackInject}}
}

void reconnect() {
  while (!mqttClient.connected()) {
    #ifdef DEBUG_SERIAL
      Serial.print("Attempting MQTT connection...");
    #endif
    snprintf(topic, 75, "home/devices/");
    snprintf(msg, 75, "device %ls disconnected", clientName);
    if (mqttClient.connect(clientName, topic, 0, true, msg)) {
      #ifdef DEBUG_SERIAL
        Serial.println("connected");
      #endif
      snprintf(msg, 75, "device %ls connected", clientName);
      mqttClient.publish(topic, msg);

      snprintf(topic, 75, "home/devices/%ls/config", clientName);
      snprintf(msg, 150, "%ls %ls", "{{configSensors}}", "{{configExecutors}}");
      mqttClient.publish(topic, msg);

      snprintf(topic, 75, "home/devices/%ls/cmd/#", clientName);
      mqttClient.subscribe(topic);

      {{mqttConnectInject}}
    } else {
      #ifdef DEBUG_SERIAL
        Serial.print("failed, rc=");
        Serial.print(mqttClient.state());
        Serial.println(" try again in 5 seconds");
      #endif
      delay(5000);
    }
  }
}

void loop() {
  if (!mqttClient.connected()) {
    reconnect();
  }
  mqttClient.loop();

  long now = millis();

  if (now - lastMsg > readDelay) {
    lastMsg = now;

    {{loopInject}}
  }
}
