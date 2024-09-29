{ nautilus-scripts, ... }:

{

  home.file = {
    ".local/share/nautilus/scripts/Convert to GIF" = {
      source = "${nautilus-scripts}/convert-to-gif";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to JPG" = {
      source = "${nautilus-scripts}/convert-to-jpg";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to MP3" = {
      source = "${nautilus-scripts}/convert-to-mp3";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to MP4" = {
      source = "${nautilus-scripts}/convert-to-mp4";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to PDF" = {
      source = "${nautilus-scripts}/convert-to-pdf";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to PNG" = {
      source = "${nautilus-scripts}/convert-to-png";
      executable = true;
    };
    ".local/share/nautilus/scripts/Upload to Imgur" = {
      source = "${nautilus-scripts}/upload-to-imgur";
      executable = true;
    };
    ".local/share/nautilus/scripts/Upload to Pastebin" = {
      source = "${nautilus-scripts}/upload-to-pastebin";
      executable = true;
    };
  };

}
