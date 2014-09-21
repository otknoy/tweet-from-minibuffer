(defvar tfm-directory (file-name-directory load-file-name))

(defun tweet (status)
  "tweet from minibuffer."
  (interactive "stweet: ")
  
  (shell-command
   (concat "ruby " tfm-directory "tweet.rb " status " &")
   "Tweet Result")
  )

(provide 'tweet-from-minibuffer)