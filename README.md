#  Foodify-repo  


# 🍽️ Foodify – Online Food Ordering System

<img width="100" height="100" alt="Screenshot 2025-09-24 160357" src="https://github.com/user-attachments/assets/8c4f1b55-5124-424d-a611-00a080007de4" />

## 📌 Project Overview

Foodify is an **online food ordering system** where users can explore restaurants, explore the menu by restaurants, add items to the cart, place orders, and track their order history.
The project is developed using **HTML, CSS3, JSP, Java, JDBC, Servlets, and MySQL**, following the **DAO design pattern**.

---
### 🛠️ Technologies Used

<p align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original.svg" alt="HTML5" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original.svg" alt="CSS3" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg" alt="Java" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/tomcat/tomcat-original.svg" alt="Tomcat" width="60" height="60"/>
</p>
---

## 📂 Project Phases

## Phase 1
Created database with 5 main tables: **User, Restaurant, Menu, Orders, OrderItem**.

## Phase 2
Designed **DAO Design Pattern** for all tables with segregated packages:

- POJO classes  
- DAO Interfaces  
- DAO Implementations  
- Launcher classes for inserting data from Java  

## Phase 3
Created servlet to **display all restaurants** and pass the data to **JSP** for showing dynamic restaurant listings.

## Phase 4
Displayed **menus under specific restaurants** with **Add to Cart** buttons.

## Phase 5
When user clicks **Add to Cart**, checks if:

- Cart exists or not  
- Items are from the same restaurant  
  Allows **increase, decrease, and remove** cart items.  

## Phase 6
Added **place order functionality**:

- Requires user **address & payment mode**  
- Checks if the user is logged in (if not, redirects to login/registration)  
- Validates and processes the order
 
## 📂 Phase 7 – Order History

* User can view previous orders
* See ordered menu items
* Reorder previous orders with one click
---

## ✨ Features

* 🔍 Explore restaurants without login
* 🛒 Add menus to cart from the same restaurant
* 📦 Increase, decrease, or remove items from cart
* 🏠 Save user address before checkout
* 💳 Choose payment mode before placing an order
* 📜 View **order history** and reorder past items
* 🔐 Login/Registration validation before checkout

---
 ### 📷 Screenshots

---

## See my code using this link👇🏿

👉 [GitHub Repository](https://github.com/jayakanthDeveloper/Foodify)

---
## 🚀 How to Run

1. Clone the repository
2. Import into your IDE (Eclipse/IntelliJ)
3. Configure **Tomcat Server**
4. Create database and import SQL file
5. Run on **localhost**

---
## 📬 Contact

For queries, contact: **[dhileepmca2025@gmail.com](mailto:dhileepmca2025@gmail.com)**
