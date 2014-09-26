---
layout: page
title: How to setup and manage application metrics
link: Application Metrics
language: en
permalink: /en/application-metrics.html
---

To be able to successfully use application metrics, your application should expose an unique URL for each application metric, reporting the value for that metric.

The format of the metric data should be in JSON format:

```
{
  "metricsName":"current_users",
  "value":3.0
}
```

For each metric you can give the following information:

* **Name**: a metric unique identifier;
* **Endpoint**: must be defined in the form of a relative URL (e.g.: */metric/users*);
* **Polling frequency**: the platform will poll your endpoint with this frequency;
* **Measuring unit**: can be *Item* or *MBytes*;
* **Price per unit** (optional): price applied for each application metric value received.
