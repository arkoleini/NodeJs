# Node.js Application Documentation - `app.js`

## Overview

The `app.js` file serves as the main entry point for a Node.js web application built with Express.js. It orchestrates server setup, middleware integration, route handling, and database connectivity. The application leverages MongoDB for data storage and incorporates features such as session management, CSRF protection, and custom logging.

## Dependencies

- **dotenv**: Loads environment variables from a `.env` file into `process.env`.
- **path**: Provides utilities for file and directory path operations.
- **express**: Node.js web application framework.
- **body-parser**: Middleware for parsing incoming request bodies.
- **mongoose**: Object modeling tool for MongoDB.
- **express-session**: Session middleware for Express.
- **connect-mongodb-session**: MongoDB session store for Express sessions.
- **csurf**: Middleware for CSRF token generation and validation.
- **cors**: Middleware for enabling CORS (Cross-Origin Resource Sharing).
- **logger**: Custom logging utility (assumed located in `./util/logger`).

## Functionality

### Environment Variables and Directory Setup

- Initializes environment variables using `dotenv`.
- Checks and creates a `Drivelog` directory if it does not exist.

### Express App Initialization

- Creates an Express application instance.
- Configures MongoDB store for session handling.
- Sets EJS as the view engine and specifies the views directory.

### Middleware Configuration

- Enables CORS for cross-origin requests.
- Configures body-parser for URL-encoded data.
- Serves static files from the `public` directory.
- Implements session middleware with MongoDB storage.
- Integrates CSRF protection.
- Populates `req.user` with user data from session if available.
- Adds `isAuthenticated` and `csrfToken` to response locals for use in views.

### Routes

- Sets up application routes for `admin`, `shop`, and `auth` functionalities.
- Includes a catch-all route for handling 404 (Not Found) errors.

### Database Connection and Server Launch

- Establishes a connection to MongoDB using Mongoose.
- Starts the Express server on port 3000 after successful database connection.
- Logs server startup and error events.

## Security Features

- **Session Management**: Utilizes `express-session` with MongoDB for robust session data storage.
- **CSRF Protection**: Employs `csurf` middleware for CSRF token management.
- **CORS**: Implements CORS policy via `cors` middleware.

## Error Handling

- Custom `logger` utility for consistent error logging.
- Middleware for capturing and handling 404 errors.

#### File: `auth.js`

- **Purpose**: Handles authentication-related routes in the application.
- **Dependencies**: Uses `express` for routing and `authController` for handling authentication logic.
- **Routes**:
  - `GET /login`: Displays the login page.
  - `GET /signup`: Displays the signup page.
  - `POST /login`: Processes login data submitted from the login form.
  - `POST /signup`: Processes signup data submitted from the signup form.
  - `POST /logout`: Handles user logout functionality.
- **Export**: Exports the configured router for use in the main application.

#### File: `admin.js`

- **Purpose**: Manages routes related to the admin section of the application.
- **Dependencies**: Uses `express` for routing, `isauth` middleware for authentication, and `adminController` for admin-specific logic.
- **Routes**:
  - `GET /add-product`: Displays the form to add a new product (protected by `isauth`).
  - `GET /products`: Lists all products for the admin (protected by `isauth`).
  - `POST /add-product`: Processes the addition of a new product (protected by `isauth`).
  - `GET /edit-product/:productId`: Displays the form to edit a product (protected by `isauth`).
  - `POST /edit-product`: Processes the update of a product (protected by `isauth`).
  - `POST /delete-product`: Handles the deletion of a product (protected by `isauth`).
- **Export**: Exports the router for integration into the main application.

#### File: `shop.js`

- **Purpose**: Handles routes related to the main shopping functionality.
- **Dependencies**: Uses `express` for routing, `isauth` middleware for authentication, and `shopController` for shop-related logic.
- **Routes**:
  - `GET /`: Displays the main index or landing page of the shop (protected by `isauth`).
  - `GET /products`: Shows all products available in the shop (protected by `isauth`).
  - `GET /products/:productId`: Displays a single product's details (protected by `isauth`).
  - `GET /cart`: Shows the user's shopping cart (protected by `isauth`).
  - `POST /cart`: Handles adding a product to the shopping cart (protected by `isauth`).
  - `POST /cart-delete-item`: Manages the removal of a product from the cart (protected by `isauth`).
  - `POST /create-order`: Processes the creation of an order from the cart items (protected by `isauth`).
  - `GET /orders`: Displays all orders made by the user (protected by `isauth`).
- **Export**: Exports the router to be used in the main application.

#### File: `is-auth.js`

- **Purpose**: This middleware ensures that only authenticated users can access certain routes.
- **Functionality**:
  - Checks if the user is logged in (`req.session.isLoggedIn`).
  - If not logged in, logs the access attempt and redirects the user to the login page.
  - If logged in, allows the request to proceed to the next middleware or route handler.
- **Logging**: Uses a custom logger to record unauthorized access attempts.

#### File: `order.js`

- **Purpose**: Defines the schema for `Order` in a MongoDB database using Mongoose.
- **Schema Structure**:
  - `products`: An array of products in the order. Each product has a `product` object and a `quantity`.
  - `user`: Contains user details associated with the order, including `name` and `userId` (referencing the `User` model).
- **Mongoose Model**: Exports a Mongoose model named `Order` based on `orderSchema`.

#### File: `product.js`

- **Purpose**: Defines the schema for `Product` in the MongoDB database.
- **Schema Structure**:
  - `title`: String, required.
  - `price`: Number, required.
  - `description`: String, required.
  - `imageUrl`: String, required.
  - `userId`: A reference to the `User` model, indicating the user who added the product.
- **Mongoose Model**: Exports a Mongoose model named `Product` based on `productSchema`.

#### File: `user.js`

- **Purpose**: Defines the schema for `User` in the MongoDB database.
- **Schema Structure**:
  - `name`: String, required.
  - `email`: String, required.
  - `cart`: An object representing the user's shopping cart, containing an array of items. Each item includes a `productId` (referencing `Product`) and `quantity`.
- **Methods**:
  - `addToCart`: Adds a product to the user's cart or increases the quantity if it already exists.
  - `removeFromCart`: Removes a product from the user's cart.
  - `clearCart`: Clears all items from the user's cart.
- **Mongoose Model**: Exports a Mongoose model named `User` based on `userSchema`.

#### File: `controllers\admin.js`

- **Purpose**: Manages the administrative functionalities related to products.
- **Key Functions**:
  - `getAddProduct`: Renders the page to add a new product.
  - `postAddProduct`: Handles the submission of a new product.
  - `getEditProduct`: Renders the edit product page.
  - `postEditProduct`: Processes the updates to an existing product.
  - `getProducts`: Displays a list of all products in the admin view.
  - `postDeleteProduct`: Handles the deletion of a product.
- **Model Used**: `Product` model for product-related operations.

#### File: `Controllers\auth.js`

- **Purpose**: Handles authentication-related actions.
- **Key Functions**:
  - `getLogin`: Renders the login page.
  - `postLogin`: Handles the login process, sets a cookie, and redirects to the homepage.
- **Cookie Management**: Sets a cookie upon successful login for session management.

#### File: `Controllers\error.js`

- **Purpose**: Provides error handling, specifically for 404 errors.
- **Key Function**:
  - `get404`: Renders a 404 error page when a requested page is not found.

#### File: `Controllers\shop.js`

- **Purpose**: Manages the main shopping functionalities.
- **Key Functions**:
  - `getProducts`: Displays all products available in the shop.
  - `getProduct`: Shows details of a specific product.
  - `getIndex`: Renders the main shop page with all products.
  - `getCart`: Displays the user's shopping cart.
  - `postCart`: Handles adding products to the shopping cart.
  - `postCartDeleteProduct`: Manages the removal of items from the cart.
  - `postOrder`: Processes the creation of an order.
  - `getOrders`: Displays all orders made by the user.
- **Models Used**: `Product` and `Order` models for handling product and order data.
