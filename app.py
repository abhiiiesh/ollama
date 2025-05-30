from fastapi import FastAPI, Request
from transformers import pipeline

app = FastAPI()
generator = pipeline("text-generation", model=model, tokenizer=tokenizer)

@app.post("/generate")
async def generate(request: Request):
    data = await request.json()
    prompt = data["prompt"]
    result = generator(prompt, max_new_tokens=150)
    return {"response": result[0]["generated_text"]} 


