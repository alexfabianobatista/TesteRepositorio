unit UServico_TerceiroCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFOFI0019 = class(TFTConsulta)
    Label2: TLabel;
    EdVendedorCod: TEdit;
    Label3: TLabel;
    EdCadastroCod: TEdit;
    Label4: TLabel;
    MEDtServico: TMaskEdit;
    SBVendedorCons: TSpeedButton;
    SBCadastroCons: TSpeedButton;
    EdVendedorNome: TEdit;
    EdCadastroNome: TEdit;
    SBOSCons: TSpeedButton;
    procedure SBVendedorConsClick(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure EdVendedorCodChange(Sender: TObject);
    procedure EdCadastroCodChange(Sender: TObject);
    procedure SBOSConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0019: TFOFI0019;

implementation

uses UOficina_cl, UVendedorCons, UVendedor_cl, UCadastroCons, UCadastro_cl,
  UOracle_cl, UOSCons, UOs_cl, UServicoTerceiro_cl;

{$R *.DFM}

procedure TFOFI0019.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons:= TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    EdVendedorCod.Text:= FloatToStr(DMVendedor.QVendedorConsCOD_VENDEDOR.Value);
    EdVendedorNome.Text:=DMVendedor.QVendedorConsNOME.Value;
  end;
end;

procedure TFOFI0019.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    EdCadastroCod.Text:= FloatToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
    EdCadastroNome.Text:=DMCadastro.QCadastroConsNOME.Value;
  end;  
end;

procedure TFOFI0019.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMServicoTerceiro do
  begin
    QServicoTerceiroCons.Close;
    if Trim(METexto.Text) = '' then
       QServicoTerceiroCons.SetVariable('NUM_OS',Null)
    else
       QServicoTerceiroCons.SetVariable('NUM_OS',METexto.Text);
    if Trim(EdVendedorCod.Text) = '' then
       QServicoTerceiroCons.SetVariable('COD_VENDEDOR',Null)
    else
       QServicoTerceiroCons.SetVariable('COD_VENDEDOR',EdVendedorCod.Text);
    if Trim(EdCadastroCod.Text) = '' then
       QServicoTerceiroCons.SetVariable('COD_CADASTRO',Null)
    else
       QServicoTerceiroCons.SetVariable('COD_CADASTRO',EdCadastroCod.Text);
    if Trim(MEDtServico.Text) = '' then
       QServicoTerceiroCons.SetVariable('DT_SERVICO',Null)
    else
       QServicoTerceiroCons.SetVariable('DT_SERVICO',MEDtServico.Text);
    QServicoTerceiroCons.Open;
  end;
end;

procedure TFOFI0019.EdVendedorCodChange(Sender: TObject);
begin
  inherited;
  if Trim(EdVendedorCod.Text) <> '' then
     EdVendedorNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+EdVendedorCod.Text)
  else
     EdVendedorNome.Text:= '';   
end;

procedure TFOFI0019.EdCadastroCodChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCadastroCod.Text) <> '' then
     EdCadastroNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+EdCadastroCod.Text)
  else
     EdCadastroNome.Text:= '';
end;

procedure TFOFI0019.SBOSConsClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    METexto.Text := DMOs.QOSConsNUM_OS.Text;
end;

end.
