## Executed

rails g scaffold Category name
rails g scaffold Size name
rails g scaffold Color name hex\_value

rails g scaffold Product name description stock:integer price:decimal category:references size:belongs\_to color:belongs\_to
