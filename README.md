# MovieApp

MovieApp is an app to help you discover and find new movies. It provides you with all the information about the movie (summary, actors, trailers ...).

## Architecture

The app is based on an **MVC pattern** mixed with **Coordinators** to remove the Navigation logic from the ViewControllers and avoid oversized ViewControllers. It also implement a reusable Network Layer to simplify request to the Movie API   

## Pods

**Alamofire/Moya**: Network Layer

**SDWebImage**: Loading image from the Web
