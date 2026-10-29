unit UFmClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmClassificacao = class(TFrame)
    Label1: TLabel;
    MeClassificacao: TMaskEdit;
    BtClassificacao: TBitBtn;
    EdClassificacao: TEdit;
    procedure BtClassificacaoClick(Sender: TObject);
    procedure MeClassificacaoExit(Sender: TObject);
    procedure MeClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UClassCadastroCons, UClassCadastro_cl, UOracle_cl;

{$R *.dfm}

procedure TFmClassificacao.BtClassificacaoClick(Sender: TObject);
begin
  if FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  if FClassCadastroCons.ShowModal = MrOk then
  begin
    MeClassificacao.Text := DMClassCadastro.QClassCadastroConsCOD_CLASS_CADASTRO.Text;
    MeClassificacaoExit(Self);
  end;
end;

procedure TFmClassificacao.MeClassificacaoExit(Sender: TObject);
begin
  if Trim(MeClassificacao.Text) <> '' then
    EdClassificacao.Text := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = ' +
                           MeClassificacao.Text, true)
  else
    EdClassificacao.Text := 'Todas';

end;

procedure TFmClassificacao.MeClassificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtClassificacao.Click;
end;

end.
