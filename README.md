# NER-Ebay-2023
My approach to the Ebay 2023 NER task for the 10,000,000 titles. Due to the competition's rule, I cannot upload the dataset here.
- First, I tried to do 2 Bidirectional LSTM models, the first for classifying tokens (which consist of 1 or multiple words), the second for the NER task.	 
- However, the first models produce a too large tokens list, which my computer cannot handle.   
- Therefore, I chose to switch to the BI tag. For every word at the beginning of tokens, I append “B-” to the front of its tag, and for every word following, I append “I-” to the front of their tag, then I do the classification.
