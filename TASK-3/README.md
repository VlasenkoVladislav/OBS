# Домашнее задание
## Настройка алертинга

Цель:
Научиться настраивать алертинг.
В данном дз вы можете воспользоваться наработками из предыдущего.


### Описание/Пошаговая инструкция выполнения домашнего задания:
Дополнительно установите Alertmanager, настройки алертинг в один из каналов оповещений на ваш выбор (Telegram, email, Slack, etc.);
Создайте набор alert`ов с различными Severity. Для начала ограничтесь warning и critical;
Alertmanager должен уметь отправлять алерты с severity critical в один канал оповещений, в то время как алерты с severity warning в другой;
В качестве результата ДЗ принимаются - файл конфигурации Alertmanager



# Описание выполнения ДЗ
---

Пример уведомление в чат вар  при условие > 10 идет в вар >15 в крит

🟡 [WARNING] HighMemoryUsageWarning

Instance: node_exporter:9100
Job:      node
Summary:  High memory usage on node_exporter:9100
Description: Memory usage is 17.3% (threshold 10%).
Started:  2026-05-05 20:55:43

🔴 [CRITICAL] HighMemoryUsageCritical

Instance: node_exporter:9100
Job:      node
Summary:  Critical memory usage on node_exporter:9100
Description: Memory usage is 19.9% (threshold 15%).
Started:  2026-05-05 20:52:43

***
  - name: memory
    rules:
      - alert: HighMemoryUsageWarning
        expr: |
          100 * (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) > 10
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High memory usage on {{ $labels.instance }}"
          description: "Memory usage is {{ printf \"%.1f\" $value }}% (threshold 10%)."
      - alert: HighMemoryUsageCritical
        expr: |
          100 * (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) > 15
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "Critical memory usage on {{ $labels.instance }}"
          description: "Memory usage is {{ printf \"%.1f\" $value }}% (threshold 15%)."
***          