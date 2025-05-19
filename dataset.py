import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_iris

# Enable visualizations inline
%matplotlib inline
# Load the Iris dataset from sklearn
iris = load_iris()

# Create a DataFrame
df = pd.DataFrame(iris.data, columns=iris.feature_names)
df['species'] = iris.target
df['species'] = df['species'].map(dict(zip(range(3), iris.target_names)))
print("First 5 rows:")
print(df.head())
print("\nDataset info:")
print(df.info())

print("\nMissing values:")
print(df.isnull().sum())
# In this dataset, there are no missing values, but in general:
df = df.dropna()  # or df.fillna(method='ffill') if applicable
print("\nMean of features by species:")
print(df.groupby('species').mean())
plt.figure(figsize=(10, 5))
plt.plot(df.index, df['sepal length (cm)'], label='Sepal Length')
plt.plot(df.index, df['petal length (cm)'], label='Petal Length')
plt.title('Sepal and Petal Length over Index')
plt.xlabel('Index')
plt.ylabel('Length (cm)')
plt.legend()
plt.grid(True)
plt.show()
plt.figure(figsize=(8, 5))
sns.barplot(x='species', y='petal length (cm)', data=df, estimator='mean')
plt.title('Average Petal Length per Species')
plt.xlabel('Species')
plt.ylabel('Petal Length (cm)')
plt.show()
plt.figure(figsize=(8, 5))
sns.histplot(df['sepal length (cm)'], bins=20, kde=True, color='skyblue')
plt.title('Distribution of Sepal Length')
plt.xlabel('Sepal Length (cm)')
plt.ylabel('Frequency')
plt.show()
plt.figure(figsize=(8, 5))
sns.scatterplot(data=df, x='sepal length (cm)', y='petal length (cm)', hue='species')
plt.title('Sepal Length vs Petal Length')
plt.xlabel('Sepal Length (cm)')
plt.ylabel('Petal Length (cm)')
plt.legend()
plt.show()
