<h2 style="color: #2913cf;">Analysis of Node.js Route Files</h2>

<h3 style="color: #c05dde;">File: <code>auth.js</code></h3>

<ul>
  <li><span style="color: #2913cf;">Purpose</span>: Handles authentication-related routes in the application.</li>
  <li><span style="color: #2913cf;">Dependencies</span>: Uses <code>express</code> for routing and <code>authController</code> for handling authentication logic.</li>
  <li>
    <span style="color: #2913cf;">Routes</span>:
    <ul>
      <li><span style="color: #3c98c9;">GET /login</span>: Displays the login page.</li>
      <li><span style="color: #3c98c9;">GET /signup</span>: Displays the signup page.</li>
      <li><span style="color: #3c98c9;">POST /login</span>: Processes login data submitted from the login form.</li>
      <li><span style="color: #3c98c9;">POST /signup</span>: Processes signup data submitted from the signup form.</li>
      <li><span style="color: #3c98c9;">POST /logout</span>: Handles user logout functionality.</li>
    </ul>
  </li>
  <li><span style="color: #2913cf;">Export</span>: Exports the configured router for use in the main application.</li>
</ul>

<h3 style="color: #c05dde;">File: <code>admin.js</code></h3>

<ul>
  <li><span style="color: #2913cf;">Purpose</span>: Manages routes related to the admin section of the application.</li>
  <li><span style="color: #2913cf;">Dependencies</span>: Uses <code>express</code> for routing, <code>isauth</code> middleware for authentication, and <code>adminController</code> for admin-specific logic.</li>
  <li>
    <span style="color: #2913cf;">Routes</span>:
    <ul>
      <li><span style="color: #3c98c9;">GET /add-product</span>: Displays the form to add a new product (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /products</span>: Lists all products for the admin (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /add-product</span>: Processes the addition of a new product (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /edit-product/:productId</span>: Displays the form to edit a product (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /edit-product</span>: Processes the update of a product (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /delete-product</span>: Handles the deletion of a product (protected by <code>isauth</code>).</li>
    </ul>
  </li>
  <li><span style="color: #2913cf;">Export</span>: Exports the router for integration into the main application.</li>
</ul>

<h3 style="color: #c05dde;">File: <code>shop.js</code></h3>

<ul>
  <li><span style="color: #2913cf;">Purpose</span>: Handles routes related to the main shopping functionality.</li>
  <li><span style="color: #2913cf;">Dependencies</span>: Uses <code>express</code> for routing, <code>isauth</code> middleware for authentication, and <code>shopController</code> for shop-related logic.</li>
  <li>
    <span style="color: #2913cf;">Routes</span>:
    <ul>
      <li><span style="color: #3c98c9;">GET /</span>: Displays the main index or landing page of the shop (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /products</span>: Shows all products available in the shop (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /products/:productId</span>: Displays a single product's details (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /cart</span>: Shows the user's shopping cart (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /cart</span>: Handles adding a product to the shopping cart (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /cart-delete-item</span>: Manages the removal of a product from the cart (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">POST /create-order</span>: Processes the creation of an order from the cart items (protected by <code>isauth</code>).</li>
      <li><span style="color: #3c98c9;">GET /orders</span>: Displays all orders made by the user (protected by <code>isauth</code>).</li>
    </ul>
  </li>
  <li><span style="color: #2913cf;">Export</span>: Exports the router to be used in the main application.</li>
</ul>
