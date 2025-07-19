from langchain_groq import ChatGroq

from app.config.config import model, GROQ_API_KEY
from app.common.logger import get_logger
from app.common.custom_exception import CustomException

logger = get_logger(__name__)


def load_llm(groq_api_key: str = GROQ_API_KEY, model=model):
    try:
        logger.info("Loading LLM from Groq")

        llm = ChatGroq(
            model=model,
            groq_api_key=GROQ_API_KEY,
            temperature=0.1,
        )

        logger.info("LLM loaded sucesfully...")

        return llm

    except Exception as e:
        error_message = CustomException("Failed to load a llm", e)
        logger.error(str(error_message))
