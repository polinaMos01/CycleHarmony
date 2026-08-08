from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Cycle Harmony API",
    description="Backend API for Cycle Harmony MVP",
    version="1.0.0"
)

# Set up CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins for mobile apps
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Cycle Harmony API is running!"}

@app.get("/health")
async def health_check():
    return {"status": "ok"}
