import tkinter as tk

# Function to evaluate the expression
def evaluate_expression():
    try:
        result = eval(entry.get())
        result_label.config(text="Result: " + str(result))
    except Exception as e:
        result_label.config(text="Error")

# Create the main window
root = tk.Tk()
root.title("Simple Calculator")

# Entry field for input
entry = tk.Entry(root, width=40)
entry.grid(row=0, column=0, columnspan=4, padx=10, pady=10)

# Buttons for digits and operators with larger dimensions
buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '0', '.', '=', '+'
]

row_val = 1
col_val = 0

# Define row and column weights to make buttons larger
for i in range(5):
    root.grid_rowconfigure(i, weight=1)
for i in range(4):
    root.grid_columnconfigure(i, weight=1)

for button in buttons:
    tk.Button(root, text=button, height=3, width=6,
              command=lambda b=button: entry.insert("end", b) if b != '=' else evaluate_expression()).grid(row=row_val, column=col_val, padx=10, pady=10)
    col_val += 1
    if col_val > 3:
        col_val = 0
        row_val += 1

# Label to display the result
result_label = tk.Label(root, text="Result: ")
result_label.grid(row=row_val, column=0, columnspan=4, padx=10, pady=10)

root.mainloop()
