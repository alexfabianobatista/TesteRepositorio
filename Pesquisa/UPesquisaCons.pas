unit UPesquisaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPesquisaCons = class(TFTConsulta)
    GBPesquisaCons: TGroupBox;
    MEDt_inicial: TMaskEdit;
    MEDt_final: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBRepresentante: TSpeedButton;
    MERepresentante: TMaskEdit;
    EdRepresentante: TEdit;
    procedure SBRepresentanteClick(Sender: TObject);
    procedure MERepresentanteExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaCons: TFPesquisaCons;

implementation

uses UPesquisa_cl, UCadastroCons, UOracle_cl, UCadastro_cl;

{$R *.DFM}

procedure TFPesquisaCons.SBRepresentanteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MERepresentante.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MERepresentanteExit(self);
end;

procedure TFPesquisaCons.MERepresentanteExit(Sender: TObject);
begin
  inherited;
  If Trim(MERepresentante.Text) <> '' Then
    EdRepresentante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MERepresentante.Text))
  Else
    EdRepresentante.Text := 'Todos';

end;

procedure TFPesquisaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPesquisa do
  Begin
    QPesquisaCons.Close;

    If Trim(MERepresentante.Text) <> '' Then
      QPesquisaCons.SetVariable('CADASTRO',StrToInt(Trim(MErepresentante.Text)))
    Else
      QPesquisaCons.SetVariable('CADASTRO',Null);

    If Trim(MeDT_Inicial.Text) <> '' Then
      QPesquisaCons.SetVariable('DT_INICIAL',trim(MeDt_inicial.Text))
    Else
      QPesquisaCons.SetVariable('DT_INICIAL',Null);
    If Trim(MeDt_Final.Text) <> '' Then
      QPesquisaCons.SetVariable('DT_FINAL',Trim(MeDt_final.Text))
    Else
      QPesquisaCons.SetVariable('DT_FINAL',Null);

    QPesquisaCons.Open;
  End;

end;

end.
