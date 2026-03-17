# 🔍 RAG Pipeline

> *Retrieval-Augmented Generation — the AI's knowledge engine*

## 🔄 How It Works
| Step | What happens |
|---|---|
| 1️⃣ | 📝 MCP `.md` files split into chunks |
| 2️⃣ | 🧬 Each chunk embedded via Ollama (1024d) or Gemini (3072d) |
| 3️⃣ | 📦 Vectors stored in `meta.mcp_embeddings` (HNSW) |
| 4️⃣ | 🗣️ User question embedded as vector |
| 5️⃣ | 🔍 Cosine similarity finds top-K chunks |
| 6️⃣ | 📋 Relevant chunks injected into LLM prompt |


## 🔀 Two Modes
| Mode | When | How |
|---|---|---|
| 🎯 **pgvector HNSW** | Default | Semantic similarity search |
| 📄 **Direct MCP** | Fallback | Full template if RAG fails |


## 🧬 Embedding Model
- **Providers**: Ollama / Google Gemini
- **Models**: `snowflake-arctic-embed2` / `gemini-embedding-001`
- **Dimensions**: 1024 / 3072
- **Index**: HNSW (Hierarchical Navigable Small World)


## 📚 Knowledge Sources
| Source | Content |
|---|---|
| 🔗 Chain MCPs | Domain-specific DWH knowledge |
| 📊 Schema descriptions | Table/column metadata |
| 👥 LDAP hierarchy | User org structure |
| 📋 BI catalog | Saved query definitions |
