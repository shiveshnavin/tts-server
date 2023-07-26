import gradio as gr
from TTS.api import TTS

model_name = 'tts_models/en/vctk/vits'
promisingM = ['p282', 'p301', 'p234', 'p232', 'p256', 'p267', 'p272']
promisingF = ['p311', 'p361', 'p263', 'p306', 'p259']
speakers = promisingM + promisingF
tts = TTS(model_name)

def text_to_speech(sentence, speaker_name):
    wav = tts.tts(text=sentence, speaker=speaker_name, file_path=None, verbose=False)
    return wav

iface = gr.Interface(
    fn=text_to_speech,
    inputs=["text", "text"],
    outputs="audio",
    inputs_label=["Enter Sentence", "Enter Speaker Name"],
    outputs_label="Audio",
    examples=[
        ["Hello, this is a sample sentence.", "p282"],
        ["How are you doing?", "p301"],
    ]
)

if __name__ == "__main__":
    iface.launch()