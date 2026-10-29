unit UContratoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFContratoCons = class(TFTConsulta)
    MECodCliente: TMaskEdit;
    SBCliente: TSpeedButton;
    MECliente: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEFilial: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEDtAnoSafra: TMaskEdit;
    Label4: TLabel;
    MECodFilial: TMaskEdit;
    Label5: TLabel;
    BtProdutoCons: TSpeedButton;
    EdCodProduto: TEdit;
    EdProdutoDesc: TEdit;
    RGSituacao: TRadioGroup;
    RgTipo: TRadioGroup;
    RgTipoContrato: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure SBClienteClick(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure EdCodProdutoExit(Sender: TObject);
    procedure BtProdutoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoCons: TFContratoCons;

implementation

uses Ucontrato_cl,UBiblioteca, UFilialCons, UFilial_cl, UOracle_cl,
  UCadastroCons, UCadastro_cl, UProdutoCons, UProduto_cl, UUsuario_cl;

{$R *.DFM}

procedure TFContratoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECODFILIAL.Text),'AGRICOLA');
  with DMContrato do
    begin
      QContratoCons.Close;
      if Trim(MEtexto.Text)<>'' then
        QContratoCons.SetVariable('NUM_CONTRATO',MEtexto.Text)
      else
        QContratoCons.SetVariable('NUM_CONTRATO',Null);

      if Trim(MECodFilial.Text)<>'' then
        QContratoCons.SetVariable('COD_FILIAL',MECODFILIAL.Text)
      else
        QContratoCons.SetVariable('COD_FILIAL',Null);

      if Trim(Bib.LimpaString(MEDtAnoSafra.Text,'/'))<>'' then
        QContratoCons.SetVariable('DT_ANO_SAFRA',MEDtAnoSafra.Text)
      else
        QContratoCons.SetVariable('DT_ANO_SAFRA',Null);

      if Trim(MECodCliente.Text)<>'' then
        QContratoCons.SetVariable('COD_CADASTRO',MECODCliente.Text)
      else
        QContratoCons.SetVariable('COD_CADASTRO',Null);
      if Trim(EDCodProduto.Text)<>'' then
        QContratoCons.SetVariable('COD_PRODUTO',EDCodProduto.Text)
      else
        QContratoCons.SetVariable('COD_PRODUTO',Null);
      Case RgSituacao.ItemIndex Of
        0 : QContratoCons.SetVariable('IND_SITUACAO','ABERTO');
        1 : QContratoCons.SetVariable('IND_SITUACAO','FECHADO');
        2 : QContratoCons.SetVariable('IND_SITUACAO','NATENDIDO');
        3 : QContratoCons.SetVariable('IND_SITUACAO',Null);
      End;
      Case RgTipo.ItemIndex Of
        0 : QContratoCons.SetVariable('IND_FISICA_JURIDICA','F');
        1 : QContratoCons.SetVariable('IND_FISICA_JURIDICA','J');
        2 : QContratoCons.SetVariable('IND_FISICA_JURIDICA',Null);
      End;
      Case RgTipoContrato.ItemIndex Of
        0 : QContratoCons.SetVariable('IND_TIPO_CONTRATO','NORMAL');
        1 : QContratoCons.SetVariable('IND_TIPO_CONTRATO','SIMPLIFICADO');
        2 : QContratoCons.SetVariable('IND_TIPO_CONTRATO',Null);
      End;
      QContratoCons.Open;
    end;
end;

procedure TFContratoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    With DMFilial do
      begin
        MECodFilial.Text:=FloatToStr(QFilialConsCod_Filial.Value);
        MECodFilialExit(Self);
      end;
end;

procedure TFContratoCons.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.Buscanome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.Clear;
end;

procedure TFContratoCons.SBClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FcadastroCons.ShowModal = MrOk then
    with DmCadastro do
      begin
        MECodCliente.text:=FloatToStr(QCadastroConsCod_Cadastro.Value);
        MECodClienteExit(Self);
      end;
end;

procedure TFContratoCons.MECodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodCliente.Text)<>'' then
    MECliente.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text)
  else
    MECliente.Clear;
end;

procedure TFContratoCons.EdCodProdutoExit(Sender: TObject);
begin
  inherited;
 if Trim(EdCodProduto.Text) <> '' then
    EdProdutoDesc.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+EdCodProduto.text)
  else
    EdProdutoDesc.Clear;
end;

procedure TFContratoCons.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    EdProdutoDesc.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    EdCodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;  
end;

end.
