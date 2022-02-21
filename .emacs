;; default .emacs initialization file

(global-font-lock-mode t)

;; highlight marked region
(transient-mark-mode t)

;; man page short key
(global-set-key [(f1)]
                (lambda () (interactive)
                  (manual-entry  (current-word))))

;; turn on c++ mode for files with extension .h
(setq auto-mode-alist (cons '("\\.h\\b" . c++-mode) auto-mode-alist))

;; default compile command is empty
(add-hook 'c++-mode-hook
      '(lambda () (setq compile-command "")))

;; This variable control the on/off of the auto compilation command for gcc.
;; Replace "nil" with "t" will turn it on
(setq create-gcc-compile-command nil)

(defvar g++-other-options "-g -Wall"
  "other options for g++; e.g., -O2")

(defun gcc-compile-command (filename)
  (let* ((program-name (file-name-nondirectory filename))
	 (executable-name  
	  (file-name-sans-extension program-name)))
    (concat "g++ "
	    program-name
 	    " -o "
 	    executable-name
	    " "
	    g++-other-options)))

(defadvice compile (before gnu-compilation activate  )

   "Automatic setting the compile-command using the form 

       g++ <program.cpp> -o <program> 

   followed by the value of g++-other-options"
   (interactive 
    (if (and create-gcc-compile-command  ;; only if auto-gcc-compile-command
                                         ;; is non-nil (turn on)
	     (equal mode-name "C++"))    ;; special treatment for c++
	(list (read-from-minibuffer
	       "Compile command: "
	       (gcc-compile-command buffer-file-name)))
      (list (read-from-minibuffer "Compile command: "
             compile-command))))) ;; default otherwise
      

;; turn on electric indentation for c++ mode
(add-hook 'c++-mode-hook
          '(lambda () (c-toggle-auto-state t)))

(custom-set-variables
 
;; cleanup list for c++ mode that delete unwanted newlines
 '(c-cleanup-list (quote (brace-else-brace brace-elseif-brace
brace-catch-brace empty-defun-braces list-close-comma scope-operator
defun-close-semi)))
 
;; controlling the "hanging braces" style
 '(c-hanging-braces-alist (quote ((defun-open after) (inline-open after)
(brace-entry-open after) (substatement-open after) (block-close .
c-snug-do-while) (extern-lang-open after) (brace-list-close nil)
(brace-list-open nil) (class-open after))))
)

