
(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
(setq csv-separators '("," ";" "|" " "))

(provide 'init-misc)
