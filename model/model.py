import pickle
import os

# model path
model_filename = os.path.join('model', "iris_clf.pkl")

# Loading the trained model
model = pickle.load(open(model_filename, "rb"))

# Mapping of class indices to their corresponding class labels
classes = {0:'setosa', 1:'versicolor', 2:'virginica'}

# prediction function - returns the class name (str)
def predict_pipe(input_sample):
    pred = model.predict([input_sample])
    return classes[pred[0]]