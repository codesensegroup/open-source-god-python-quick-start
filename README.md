# Python AI Chat Side Project - 模組分類與 MVP 規劃

## **模組分類**
### 1. **用戶管理模組**
- **基礎功能：**
  - 用戶註冊與登入（Email 與密碼）。
  - 密碼加密（使用 bcrypt 或 Argon2）。
  - 基於 OAuth2 的第三方登入（Google、Facebook）。
  - IP 與裝置登入記錄（紀錄登入時間與地點）。
  - 密碼重設功能。

- **進階功能：**
  - 多因子驗證（MFA）支援。

---

### 2. **AI 對話模組**
- **基礎功能：**
  - AI 多輪對話（基於 LangChain 與本地模型）。
  - 上下文記憶功能。
  - 模型參數調整（如 `temperature`、`max_tokens`）。

- **進階功能：**
  - 多語言支持。
  - 模型切換（本地模型與外部 API 切換）。
  - AI 對話情緒調整（如友善、正式、幽默）。

---

### 3. **對話紀錄模組**
- **基礎功能：**
  - 儲存對話紀錄（時間戳 + 內容）。
  - 檢閱與刪除對話紀錄。
  - 清理機制（自動刪除過期紀錄）。

- **進階功能：**
  - 對話紀錄下載（支持 JSON、CSV 格式）。
  - 壓縮打包（ZIP 格式）。

---

### 4. **文件檢索模組（進階）**
- **基礎功能：**
  - 文件上傳支持（PDF、TXT、DOCX）。
  - 文件向量化處理（嵌入模型，如 Sentence Transformers）。
  - 向量資料存儲與檢索。

- **進階功能：**
  - 文件檢索接口優化（支持模糊匹配與排序）。

---

### 5. **基礎架構模組**
- **基礎功能：**
  - 使用 Docker Compose 管理開發與運行環境。
  - 使用 Nginx 實現負載均衡。
  - 日誌記錄與監控（OpenTelemetry、Prometheus、Grafana）。
  - 版本控制（GitHub）。
  - 測試框架（unittest/pytest）。

- **進階功能：**
  - CI/CD 管道（GitHub Actions）。
  - 性能監控儀表板（Grafana）。

---

## **MVP 規劃**
### **MVP 目標**
實現一個簡單的 AI Chat 系統，支持以下功能：
1. **用戶管理模組：**
   - 用戶註冊與登入（Email 密碼方式）。
   - 密碼加密（bcrypt）。
   - 基本的登入記錄（僅記錄 IP 與時間）。

2. **AI 對話模組：**
   - 單輪對話（本地模型）。
   - 上下文記憶（儲存最近的對話）。
   - 模型參數調整（如 `temperature`）。

3. **對話紀錄模組：**
   - 紀錄對話內容與時間戳。
   - 檢閱對話紀錄。

4. **基礎架構模組：**
   - Docker Compose 配置開發環境。
   - 使用 FastAPI 開發後端。
   - 使用 SQLite 作為資料庫（快速上手）。
   - 基本的日誌記錄（紀錄用戶請求）。

---

### **MVP 技術選型**
1. **程式語言與框架：**
   - Python 3.11
   - FastAPI（後端框架）
   - LangChain（AI 模型集成）

2. **AI 模型：**
   - 本地模型：Ollama/LLama 3.2 1B（低資源需求）。
   - 嵌入模型：待選（可略過向量化部分）。

3. **資料儲存：**
   - SQLite（快速搭建與使用）。

4. **部署：**
   - Docker Compose（方便管理多服務）。

---

### **學習者快速上手步驟**
1. **第 1 週：基礎環境搭建**
   - 安裝 Docker 與 Docker Compose。
   - 配置 FastAPI 專案結構。
   - 建立 SQLite 資料庫，設置用戶表與對話紀錄表。

2. **第 2 週：用戶註冊與登入**
   - 開發用戶註冊與登入 API。
   - 添加密碼加密與登入日誌功能。
   - 實現簡單的登入驗證邏輯。

3. **第 3 週：AI 對話功能**
   - 集成 LangChain，實現基本 AI 多輪對話。
   - 開發上下文記憶功能（保存最近 5 條對話）。
   - 提供簡單的調整參數接口（如溫度）。

4. **第 4 週：對話紀錄功能**
   - 開發對話紀錄儲存與檢閱 API。
   - 添加簡單的刪除功能（按 ID 刪除）。

5. **第 5 週：測試與優化**
   - 編寫基本的單元測試（unittest）。
   - 使用 Docker Compose 啟動整體環境。
   - 確保基礎功能運行穩定。

---

### **學習者成果**
- 完成一個支持用戶登入與簡單 AI 對話的應用。
- 獲得 FastAPI 與 LangChain 的實踐經驗。
- 熟悉基礎架構（Docker Compose, SQLite）。
- 為進一步擴展功能（如文件檢索、進階模型集成）打下基礎。

---
## 資源需求：
1. 程式語言版本：Python 3.11（待定）
2. 生成語言框架：Langchain
3. LLM模型：
   - Local: Ollama/LLama 3.2 1B（資源使用最少）
4. 嵌入模型：（待定，繁中模型？）
5. 資料庫
   - 使用者資訊
   - 對話紀錄
   - 檢索用資料（VectorDB）
6. 前端頁面：Angular
7. 後端框架：FastAPI
8. 資源管理：Docker-compose
9.  版本控制：GitHub
10. CICD：GitHub Action
11. 單元測試：unittest / pytest（待定）
12. 負載擴展：Nginx
13. 日誌記錄：Open telemetry, Prometheus , Grafana
---
## 執行方式
1. 執行 `git clone https://github.com/codesensegroup/open-source-god-python-quick-start.git`
2. 執行 `cd open-source-god-python-quick-start.git`
3. 執行 `bash init.sh`
4. 開啟 swagger: `http://localhost:7717/docs`
5. 即可使用 POST /chat 和 LLM 對話
