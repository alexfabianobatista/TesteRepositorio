unit UFmConhecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBGrids;

type
  TFmConhecimento = class(TFrame)
    Conhecimento: TLabel;
    MeConhecimento: TMaskEdit;
    BtConhecimento: TBitBtn;
    EdConhecimento: TEdit;
    Label1: TLabel;
    procedure MeConhecimentoExit(Sender: TObject);
    procedure MeConhecimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtConhecimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFmConhecimento.MeConhecimentoExit(Sender: TObject);
var
  Buscador : TBuscador;
begin
  if Trim(MeConhecimento.Text) <> '' then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('NUM_Conhecimento', 'TB_Conhecimento', 'COD_Conhecimento = ' + MeConhecimento.Text);
    Buscador.Adiciona('DT_EMISSAO', 'TB_Conhecimento', 'COD_Conhecimento = ' + MeConhecimento.Text);
    Buscador.Buscar;
    EdConhecimento.Text := 'Número: ';
    EdConhecimento.Text := EdConhecimento.Text + Buscador.Proximo;
    EdConhecimento.Text := EdConhecimento.Text + ', Emissão: ';
    EdConhecimento.Text := EdConhecimento.Text + Buscador.Proximo;
  end
  else
    EdConhecimento.Text := 'Todas';
end;

procedure TFmConhecimento.MeConhecimentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtConhecimento.Click;
end;

procedure TFmConhecimento.BtConhecimentoClick(Sender: TObject);
var
  Form: TForm;
  Err: String;
begin
  try
    Form := TFormClass(GetClass('TFConhecimentoCons')).Create(Application);
  except
    on E: Exception do
    begin
      Err := E.Message;
      Form := nil;
    end;
  end;
  if Form = nil then
  begin
    MessageDlg('Desculpe, não é possível fazer consulta desse tipo de Conhecimento deste sistema.' +
        #13 + #10 + Err, mtError, [mbOK], 0);
    Exit;
  end;
  if Form.ShowModal = MrOk then
  begin
    MeConhecimento.Text := TDBGrid(Form.FindComponent('DBGrid1')).DataSource.DataSet.FieldByName('COD_Conhecimento').Text;
    MeConhecimentoExit(Sender);
  end;
end;

end.
