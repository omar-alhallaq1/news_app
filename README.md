<p align="center">
  <a href="https://flutter.dev" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg" alt="Flutter" width="90">
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://dart.dev" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg" alt="Dart" width="90">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/News_API-005571?style=flat&logo=json&logoColor=white" alt="News API">
  <img src="https://img.shields.io/badge/Clean_Architecture-20232A?style=flat" alt="Clean Architecture">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=flat" alt="License MIT">
</p>

> This project strictly adheres to Clean Architecture principles to deliver a scalable, maintainable, and high-performance news aggregation user experience using native Flutter capabilities.

---

## Table of Contents
- [Architecture & Design Patterns](#architecture--design-patterns)
- [Features Implemented](#features-implemented)
- [Tech Stack](#tech-stack)
- [UI/UX Design (Figma)](#uiux-design-figma)
- [Getting Started](#getting-started)

---

## Architecture & Design Patterns

The project is structured following **Clean Architecture**, split into distinct layers to separate concerns and ensure testability:

* **Presentation Layer:** Contains UI components, views, and widgets that are completely modular, reactive, and designed to consume asynchronous data streams cleanly for smooth feeds and transitions.
* **Domain Layer:** Contains the core business logic, entities (e.g., `NewsArticle`), and use cases (e.g., `GetLatestNews`, `SearchNews`), acting as the completely independent heart of the application.
* **Data Layer:** Handles asynchronous data retrieval from remote News APIs using **Dio**, data mapping via robust Models to parse complex JSON payloads, and repository implementations.

---

## Features Implemented

* **Synchronous & Real-time Data Fetching:** Seamlessly synchronizes with the remote News API to fetch and display the latest breaking news headlines instantly upon app launch or manual refresh.
* **Advanced Real-time Search Feed:** Powered by dedicated search use cases, allowing users to query topics, keywords, or specific news sources dynamically with instant UI updates.
* **Full Localization & Translation Support:** Implements a dynamic translation system allowing the application to handle multiple languages and localize news categories smoothly.
* **Premium News Feed UI/UX:** Implements a modern **Shimmer Loading UI** skeletal structure during asynchronous data fetching to elevate perceived performance and user experience.
* **Type-Safe Asset & Category Management:** Article parsing handles image placeholders, mixed content types, and fallback sources elegantly under a unified and stable design system.

---

## Tech Stack

| Category | Technology / Package |
| :--- | :--- |
| **Frontend Core** | Flutter & Dart |
| **Networking** | Dio (Interceptors, Asynchronous Handling) |
| **Localization** | Flutter Localizations / Easy Localization |
| **Backend Target** | RESTful News APIs (e.g., NewsAPI / GNews) |

---

## UI/UX Design (Figma)

The user interface and user experience components of this application are completely mapped out and designed on Figma. You can explore the full design system, wireframes, and interactive prototypes through the link below:

**[Explore Figma Design Prototype](https://www.figma.com/design/7Pnafhzi7djgWcp2XYu6Z2/News-And-Weather-App?node-id=0-1&p=f&t=zvKgjuR1hiW5g9Ii-0)**

---

## Getting Started

### Prerequisites
Ensure you have the Flutter SDK installed and configured on your machine.
* Flutter SDK (v3.x or higher recommended)
* Dart SDK

### Installation Steps

1.  **Clone the Repository:**
```bash
    git clone [https://github.com/your-username/news-app.git](https://github.com/your-username/news-app.git)
    ```
2.  **Navigate to Project Root:**
```bash
    cd news-app
    ```
3.  **Fetch Application Dependencies:**
```bash
    flutter pub get
    ```
4.  **Run the Project:**
```bash
    flutter run
    ```

---

## Commit Standard

This project enforces the **Conventional Commits** specification to ensure a clean, meaningful git log graph:
* `feat:` for new features (e.g., `feat: implement news search functionality`)
* `fix:` for bug fixes (e.g., `fix: resolve asynchronous image loading crash`)
* `refactor:` for code changes that neither fix a bug nor add a feature
