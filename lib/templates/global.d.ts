interface File {
  file: string;
  steps: [Step];
}

interface Step {
  title:     string;
  arguments: string[];
}

interface Window {
  steps: [File];
}
