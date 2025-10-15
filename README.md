# README

# Weather Forecast Rails App

## Description
Enterprise-grade Ruby on Rails weather forecasting application. Accepts an address, retrieves forecast data, caches by zip code, and indicates cache status for each request.

## Features
- Address input and geocoding
- Real-time weather forecast (current/high/low temps)
- 30-minute cache per zip code
- Cache indicator shown to user
- Comprehensive RSpec unit tests
- Well-structured service objects
- Robust error handling

## Getting Started
### Prerequisites
- Ruby 3.x and Rails 7.x
- PostgreSQL database
- OpenWeatherMap API key (store in `.env`)

### Setup

git clone <repo-url>
cd weather_app
bundle install
rails db:create db:migrate
rails server

Add `.env`:

### Running Tests
Add `.env`:
WEATHER_API_KEY=your_openweather_key

### Running Tests
bundle exec rspec


## Architectural Overview
### Object Decomposition
- **Controller**: Handles input/output to user
- **GeocodeService**: Encapsulates geocode logic for address
- **WeatherService**: Handles API interaction and weather parsing
- **Caching**: Implemented via Rails.cache, keyed by country + postal code

### Design Patterns
- **Service Object pattern** for API interaction and business logic.
- **Encapsulation**: Business logic isolated from the controller layer.

### Scalability Considerations
- Read-heavy, with aggressive caching to minimize API calls.
- Easily extendable to background jobs or external cache stores.

### Naming Conventions
- Clear, descriptive, Rails-standard (e.g., WeatherService, ForecastsController).

### Testing
- RSpec unit and functional tests for all classes and endpoint logic.
- Edge cases are covered (API failure, invalid address, cache logic).

### Best Practices
- Secrets managed in `.env`, never committed.
- Code is DRY and SRP-focused.
- Robust error handling for all external calls.

## Contributions
Open to PRs after review.

## License
MIT

