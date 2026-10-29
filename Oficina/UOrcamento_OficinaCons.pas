unit UOrcamento_OficinaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFOFI0005 = class(TFTConsulta)
    GroupBox1: TGroupBox;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBCadastroCons: TSpeedButton;
    SBVendedorCons: TSpeedButton;
    EdVendedorCod: TEdit;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0005: TFOFI0005;

implementation

uses UOficina_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFOFI0005.FormActivate(Sender: TObject);
begin
  inherited;
  MEDataI.Text:= DateToStr(Date);
  MEDataF.Text:= DateToStr(Date);
end;

procedure TFOFI0005.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMOficina.QOrcamento_OficinaCOD_CADASTRO.Value:= DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFOFI0005.BtProcurarClick(Sender: TObject);
begin
  inherited;
  if (Trim(FOFI0005.MEDataI.Text) = '') or
     (Trim(FOFI0005.MEDataF.Text) = '') then
     raise exception.Create('Periodo deve ser informado!');

  with DMOficina do
  begin
    QOrcamento_OficinaCons.Close;

    if Trim(FOFI0005.METexto.Text) = '' then
       QOrcamento_OficinaCons.SetVariable('COD_CADASTRO',Null)
    else
       QOrcamento_OficinaCons.SetVariable('COD_CADASTRO',FOFI0005.METexto.Text);

    if Trim(FOFI0005.EdVendedorCod.Text) = '' then
       QOrcamento_OficinaCons.SetVariable('COD_VENDEDOR',Null)
    else
       QOrcamento_OficinaCons.SetVariable('COD_VENDEDOR',FOFI0005.EdVendedorCod.Text);

    QOrcamento_OficinaCons.SetVariable('DT_EMISSAO_I',FOFI0005.MEDataI.Text);
    QOrcamento_OficinaCons.SetVariable('DT_EMISSAO_F',FOFI0005.MEDataF.Text);

    QOrcamento_OficinaCons.Open;
  end;
end;

end.
