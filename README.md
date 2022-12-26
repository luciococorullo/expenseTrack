# Expense Tracker
This project is a personal expense tracking app that allows you to keep track of your spending and budget. The app features a chart that tracks this month's spending as of the current date, and you can drag over the chart line to see the history of total spending for specific days. The app also displays the most recent five transactions at the bottom of the main view, with each transaction showing the merchant, category, date, and amount. The amount is negative for debits and positive (and colored) for credits. The app also uses icons from the SwiftUIFontIcon library to represent the categories of each transaction.

If you click on the "See All" link, you will be redirected to the all transactions screen, where transactions are grouped by month. The app also has a beautiful dark mode.

Some of the tasks that were completed during the development of this project include:

Setting up the project and creating a color system
Implementing the SwiftUIFontIcon library to add category icons to transactions
Fetching and processing transaction data using the dataTaskPublisher method
Storing received data in a @StateObject
Grouping transactions by month and displaying them in a list
Implementing the SwiftUICharts library to create a line chart for the main view
Calculating the cumulative sum of daily expenses
Rounding chart data to two decimal places
We hope you find this app useful in tracking and managing your expenses.
