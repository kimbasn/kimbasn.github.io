---
title: "Toll Plaza Simulator Project"
excerpt: ""
header:
  teaser: assets/images/toll-plaza.avif
  overlay_image: assets/images/unsplash-image-11.jpg
  caption: "Photo credit: [**Marcus Spiske**](https://unsplash.com)"
permalink: /portfolio/toll-plaza-simulator/
date: 2024-09-30
toc: true
toc_label: "Contents"
---


## Project Overview

This project simulates a dynamic toll plaza management system that handles vehicle traffic efficiently through various toll booths. The system is designed to demonstrate real-time traffic management and processing of vehicles.

## Key Features

- **Dynamic Toll Booth Management:** Simulates multiple toll booths within each plaza, allowing vehicles to be assigned based on different strategies (e.g., shortest queue, random selection).
- **Vehicle Generation:** Continuously generates vehicles to simulate real-world traffic flow.
- **Thread Management:** Implements threading to enable simultaneous processing of vehicles across multiple booths.
- **Monitoring System:** Provides real-time logging and monitoring of vehicle assignments and processing status for each booth.
- **Customizable Parameters:** Allows customization of vehicle generation rates and booth processing speeds through environment variables.

## Architecture

![Architecture](/assets/images/traffic_flow.png)

The system architecture comprises several interconnected components:

1. Central Control System: Manages multiple toll plazas, allowing for the addition, starting, and stopping of individual plazas. It continuously generates vehicles and assigns them to toll plazas, simulating ongoing traffic across the system.
2. Toll Plaza: Encapsulates the logic for managing toll booths, including strategies for vehicle assignment and load distribution across the booths. It serves as the key interface for controlling booth operations.
3. Booth: Represents individual toll booths, handling vehicle processing, queuing, and state management (running, paused, stopped). Each booth uses a logging module to provide real-time feedback on operations and vehicle processing. Additionally, it sends processing events to the messaging system (RabbitMQ or Pub/Sub) based on the configuration settings.

## Technology Stack

- **Programming Language:** Python
- **Frameworks/Libraries:**
  - `threading`: For managing concurrent processes.
  - `queue`: For managing booth vehicle queue
  - `logging`: For tracking system operations.
  - `dotenv`: For loading environment variables.


## Conclusion

This toll plaza simulation project not only provides an interesting way to understand traffic management systems but also showcases essential programming skills, including object-oriented design, threading, and real-time processing. This project can serve as a basis for further enhancements, such as implementing a graphical user interface (GUI) or adding more complex vehicle processing algorithms.

## Future Enhancements

- **Graphical User Interface:** Develop a user-friendly interface to visualize vehicle processing and plaza status.
- **Advanced Vehicle Assignment Strategies:** Implement machine learning algorithms to optimize vehicle assignments based on historical data.
- **Integration with Real-Time Data:** Connect the system with real-world traffic data for enhanced simulation accuracy.

## **GitHub Repository**
Explore the complete codebase and documentation for the simulator on GitHub: [Toll Plaza Simulator](https://github.com/kimbasabingoye/toll-plaza-simulator)