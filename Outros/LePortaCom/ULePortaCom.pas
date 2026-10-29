unit ULePortaCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ExtCtrls;

type
  TFLePorta = class(TForm)
    Button1: TButton;
    lblLePorta: TLabel;
    lblQtdChar: TLabel;
    Memo1: TMemo;
    cbPortaCom: TComboBox;
    RadioGroup1: TRadioGroup;
    gbConfiguracoes: TGroupBox;
    cbBaudRate: TComboBox;
    Label1: TLabel;
    cbForcaConfig: TCheckBox;
    Label2: TLabel;
    cbByteSize: TComboBox;
    Label3: TLabel;
    cbParity: TComboBox;
    Label4: TLabel;
    cbStopBits: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure cbForcaConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLePorta: TFLePorta;

implementation

uses LePortaCom;

{$R *.dfm}

procedure TFLePorta.Button1Click(Sender: TObject);
var
    LePorta: TBalanca;
begin


  if LePorta = nil then
    LePorta := TBalanca.Create;
  try
  
    Memo1.Clear;

    LePorta.AbreSerial(StrToInt(Copy(cbPortaCom.Text, 4,1)),
                        StrToInt(cbBaudRate.Text),
                        StrToInt(cbByteSize.Text),
                        StrToInt(cbStopBits.Text),
                        StrToInt(cbParity.Text),
                        cbForcaConfig.Checked);
    if LePorta.SerialAberto then
    begin
      Memo1.Lines.Add('Porta ' + cbPortaCom.Text + ' aberta com sucesso!');
      if RadioGroup1.ItemIndex = 0 then
        lblLePorta.Caption := LePorta.LePesoFilizola
      else if RadioGroup1.ItemIndex = 1 then
        lblLePorta.Caption := LePorta.LePesoToledo
      else
        lblLePorta.Caption := LePorta.LePesoWT3000;
      memo1.Lines.Add(LePorta.TempSerial);
      lblQtdChar.Caption := IntToStr(Length(lblLePorta.Caption));
      LePorta.FechaSerial;
    end;
  except
    FreeAndNil(LePorta);
  end;


end;

procedure TFLePorta.cbForcaConfigClick(Sender: TObject);
begin

  gbConfiguracoes.Enabled := cbForcaConfig.Checked;

end;

end.
