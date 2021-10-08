# /bin/bash

if [ $TERM == "tmux-256color" ]
then
  tmux_cwd="$(tmux display-message -p -F "#{pane_current_path}" -t1)"

  directory_name="$(echo $tmux_cwd | rev | cut -d"/" -f1 | rev)"
  up_directory_name="$(echo $tmux_cwd | rev | cut -d"/" -f2 | rev)"
  my_documents_dir_name="$(echo $tmux_cwd | cut -d"/" -f4,5)"
  my_documents_cwd="$(echo $tmux_cwd | cut -d"/" -f6)"

  output=""

  case "$up_directory_name" in
    home)
      output="__home"
      ;;
    Drip)
      output=$directory_name
      ;;
    *)
      case "$my_documents_dir_name" in
        Documents/MyDocuments)
          output=$my_documents_cwd

          case "$up_directory_name" in
            manual_md)
              output=$directory_name
              ;;
            Documents)
              output=$directory_name
              ;;
          esac
          ;;
      esac
  esac

  tmux rename-session $output 2>/dev/null
fi
