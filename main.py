from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn

# Importing the predict_pipe function from the model module
from model.model import predict_pipe 

app = FastAPI()

# Defining a Pydantic model for the request payload
class input_txt(BaseModel):
    sample_input:list

@app.get("/")
async def root():
    return {"status":"Working!"}
    
@app.post("/predict")
async def predict(payload: input_txt):
    # Calling the predict_pipe function with the sample_input from the request payload
    iris_species = predict_pipe(payload.sample_input)
    return {"iris_species":iris_species}