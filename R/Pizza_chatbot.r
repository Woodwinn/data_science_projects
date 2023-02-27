#chatbot (rule-based)
#ordering pizza 8-10 dialog

# question 01 #################################################

print("Welcome to our Pizza!")
# receive input 1 row
customer <- readline("What's your name? ->") 
print( paste("Hi", customer))

# question 02 #################################################

print("What do you want to order today?")
order_list <- c("Pizza", "French fries", "Coke")
price_list <- c(400,150,40)
df <- data.frame(order_list,
                 price_list)
print(df)
while(TRUE){
  action <- as.numeric(readline())
  if (action == 1) {
    print("You choose order pizza.")
    break
  }else if (action == 2) {
    print("You choose order French fries.")
    break
  }else if (action == 3) {
    print("You choose order Coke.")
    break
  }else(
    print("Please select 1, 2 or 3")
  )
}
order_1 <- order_list[[action]]

# question 03 #################################################
#pizza

if (action == 1) {
  print("Which crust would you like?")
  favor_crust <- c("Pan", "Crispy thin")
  df_favor_crust <- data.frame(favor_crust)
  print(df_favor_crust)
  while(TRUE){
    favor_crust_num <- as.numeric(readline())
    if(favor_crust_num ==1 ){
      print( paste("You select pizza crust ->", favor_crust[[favor_crust_num]]))
      break
    }
    else if(favor_crust_num == 2){
      print( paste("You select pizza crust ->", favor_crust[[favor_crust_num]]))
      break
    }
    else(
      print("Please select 1 or 2")
    )
  }
  
  print("What is topping would you like?")
  favor_pizza <- c("Hawaiian","Sea food","Ham and cheese")
  df_favor_pizza <- data.frame(favor_pizza)
  print(df_favor_pizza)
  while(TRUE){
    favor_pizza_num <- as.numeric(readline())
    if(favor_pizza_num == 1){
      print( paste("You select topping ->", favor_pizza[[favor_pizza_num]]))
      break
    }
    else if(favor_pizza_num == 2){
      print( paste("You select topping ->", favor_pizza[[favor_pizza_num]]))
      break
    }
    else if(favor_pizza_num == 3){
      print( paste("You select topping ->", favor_pizza[[favor_pizza_num]]))
      break
    }
    else(
      print("Please select 1, 2 or 3")
    )
  }
  
  print("How many do you want to order?")
  pizza_num <- as.numeric(readline())
  order = c(order_1)
  type = c(favor_crust[[favor_crust_num]])
  topping = c(favor_pizza[[favor_pizza_num]])
  qty = c(pizza_num)
  total_price = c(price_list[[action]]*qty)
  df_sum_pizza <- data.frame(order,
                             type,
                             topping,
                             qty,
                             total_price)
  print(df_sum_pizza)
}

# question 04 #################################################
#french fries

if (action == 2) {
  print("Which type would you like?")
  favor_ff <- c("Crispy","Soft")
  df_favor_ff <- data.frame(favor_ff)
  print(df_favor_ff)
  while(TRUE){
    favor_ff_num <- as.numeric(readline())
    if(favor_ff_num ==1 ){
      print( paste("You select Frech fries ->", favor_ff[[favor_ff_num]]))
      break
    }
    else if(favor_ff_num == 2){
      print( paste("You select Frech fries ->", favor_ff[[favor_ff_num]]))
      break
    }
    else(
      print("Please select 1 or 2")
    )
  }
  
  print("How many do you want to order?")
  ff_num <- as.numeric(readline())
  order <- c(order_1)
  type <- c(favor_ff[[favor_ff_num]])
  qty <- c(favor_ff_num)
  total_price <- c(price_list[[action]]*qty)
  
  df_sum_ff <- data.frame(order,
                          type,
                          qty,
                          total_price)
  print(df_sum_ff)
}

# question 05 #################################################
#coke

if (action == 3) {
  print("How many do you want to order?")
  c_num <- as.numeric(readline())
  
  order <- c(order_1)
  qty <- c(c_num)
  total_price <- c(price_list[[action]]*qty)
  
  df_sum_c <- data.frame(order,
                         qty,
                         total_price)
  print(df_sum_c)
}
# question 06 #################################################
# where

print("Where would you like to eat?")
favor_get <- c("Delivery", "At shop", "Take away")
add_price <- c(50, 0, 0)
df_favor_get <- data.frame(favor_get,
                           add_price)
print(df_favor_get)
while(TRUE){
  favor_get_num <- as.numeric(readline())
  if(favor_get_num == 1 ){
    print( paste("You would like to eat ->", favor_get[[favor_get_num]]))
    break
  }
  else if(favor_get_num == 2){
    print( paste("You would like to eat ->", favor_get[[favor_get_num]]))
    break
  }
  else if(favor_get_num == 3){
    print( paste("You would like to eat ->", favor_get[[favor_get_num]]))
    break
  }
  else(
    print("Please select 1, 2 or 3")
  )
}

delivery <- c(favor_get[[favor_get_num]])
total_price <- c(qty*price_list[[action]]+
                   add_price[[favor_get_num]])

df_sum_get <- data.frame(order,
                         qty,
                         delivery,
                         total_price)
print(df_sum_get)

# question 07 #################################################
# Pay

print("Do you prefer to pay by?")
favor_pay <- c("Cash", "Transfer", "Credit card")

df_favor_pay <- data.frame(favor_pay)
print(df_favor_pay)
while(TRUE){
  favor_pay_num <- as.numeric(readline())
  if(favor_pay_num == 1 ){
    print( paste("You would like to pay by ->", favor_pay[[favor_pay_num]]))
    break
  }
  else if(favor_pay_num == 2){
    print( paste("You would like to pay by ->", favor_pay[[favor_pay_num]]))
    break
  }
  else if(favor_pay_num == 3){
    print( paste("You would like to pay by ->", favor_pay[[favor_pay_num]]))
    break
  }
  else(
    print("Please select 1, 2 or 3")
  )
}

pay_by <- c(favor_pay[[favor_pay_num]])
df_sum_pay <- data.frame(order,
                         qty,
                         delivery,
                         pay_by,
                         total_price)
print(df_sum_pay)

# question 08 #################################################
#Summary your order

if (action == 1) {
  df_sum <- data.frame(order,
                       type,
                       topping,
                       qty,
                       delivery,
                       pay_by,
                       total_price,
                       customer)
  print(df_sum)
}else if (action == 2) {
  df_sum <- data.frame(order,
                       type,
                       qty,
                       delivery,
                       pay_by,
                       total_price,
                       customer)
  print(df_sum)
}else if (action == 3) {
  df_sum <- data.frame(order,
                       qty,
                       delivery,
                       pay_by,
                       total_price,
                       customer)
  print(df_sum)
}

print("Confirm order?")
confirm <- c("Yes", "No")
df_conf <- data.frame(confirm)
print(df_conf)
while(TRUE){
  conf_num <- as.numeric(readline())
  if(conf_num == 1) {
    print("Enjoy your meals ,Thank you so much")
      break
  }
  else if(conf_num == 2) {
    print("See you again next time")
      break
  }
  else(print("Please select 1 or 2"))
}
