unit UPenhorCedularCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFPenhorCedularCons = class(TFTConsulta)
    RGSituacao: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MECliente: TMaskEdit;
    MEProduto: TMaskEdit;
    MEAnoSafra: TMaskEdit;
    BtnCadastroCons: TBitBtn;
    BitBtn1: TBitBtn;
    EdCliente: TEdit;
    EdProduto: TEdit;
    GBDtEmissao: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    MEDt_Inicio: TMaskEdit;
    MEDt_Fim: TMaskEdit;
    MENumero: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MEFilial: TMaskEdit;
    btnFilial: TBitBtn;
    edFilial: TEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtnCadastroConsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEClienteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MEFilialExit(Sender: TObject);
    procedure btnFilialClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPenhorCedularCons: TFPenhorCedularCons;

implementation

uses UPenhorCedular_cl, UCadastroCons, UProdutoCons, UCadastro_cl,
  UProduto_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFPenhorCedularCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPenhorCedular do
  Begin
    QPenhorCedularCons.Close;
    If Trim(METexto.Text) <> '' then
      QPenhorCedularCons.SetVariable('COD_PENHOR_CEDULAR',Trim(METexto.Text))
    else
      QPenhorCedularCons.SetVariable('COD_PENHOR_CEDULAR',null);

    If Trim(MENumero.Text) <> '' then
      QPenhorCedularCons.SetVariable('NUM_PENHOR_CEDULAR',Trim(MENumero.Text))
    else
      QPenhorCedularCons.SetVariable('NUM_PENHOR_CEDULAR',null);

    If Trim(MECliente.Text) <> '' then
      QPenhorCedularCons.SetVariable('COD_CADASTRO',MECliente.Text)
    else
      QPenhorCedularCons.SetVariable('COD_CADASTRO',null);

    If Trim(MEAnoSafra.Text) <> '/' then
      QPenhorCedularCons.SetVariable('DT_ANO_SAFRA',MEAnoSafra.Text)
    else
      QPenhorCedularCons.SetVariable('DT_ANO_SAFRA',null);

    If Trim(MEProduto.Text) <> '' then
      QPenhorCedularCons.SetVariable('COD_PRODUTO',MEProduto.Text)
    else
      QPenhorCedularCons.SetVariable('COD_PRODUTO',null);

    If Trim(MEFilial.Text) <> '' then
      QPenhorCedularCons.SetVariable('COD_FILIAL',MEFilial.Text)
    else
      QPenhorCedularCons.SetVariable('COD_FILIAL',null);

    If RGSituacao.ItemIndex = 0 then
      QPenhorCedularCons.SetVariable('IND_SITUACAO','ABERTO');
    If RGSituacao.ItemIndex = 1 then
      QPenhorCedularCons.SetVariable('IND_SITUACAO','FECHADO');
    If RGSituacao.ItemIndex = 2 then
      QPenhorCedularCons.SetVariable('IND_SITUACAO',null);

    IF trim(MEDt_Inicio.text) <> '' then
      QPenhorCedularCons.SetVariable('DT_INICIO',MEDt_Inicio.text)
    else
      QPenhorCedularCons.SetVariable('DT_INICIO',null);

    IF trim(MEDt_Fim.text) <> '' then
      QPenhorCedularCons.SetVariable('DT_FIM',MEDt_Fim.text)
    else
      QPenhorCedularCons.SetVariable('DT_FIM',null);

    {QPenhorCedularCons.SQL.Clear;
    QPenhorCedularCons.SQL.Add('SELECT   TB_PENHOR_CEDULAR.COD_PENHOR_CEDULAR, TB_PENHOR_CEDULAR.COD_CADASTRO,   TB_PENHOR_CEDULAR.COD_PRODUTO,');
    QPenhorCedularCons.SQL.Add('  TB_PENHOR_CEDULAR.COD_FILIAL,  TB_PENHOR_CEDULAR.QT_QUANTIDADE,  TB_PENHOR_CEDULAR.IND_SITUACAO,  TB_PENHOR_CEDULAR.DT_ANO_SAFRA,  TB_PENHOR_CEDULAR.COD_BANCO_AGENCIA');
    QPenhorCedularCons.SQL.Add('FROM   TB_PENHOR_CEDULAR,  TB_CADASTRO,  TB_PRODUTO,  TB_FILIAL,  TB_BANCO_AGENCIA');
    QPenhorCedularCons.SQL.Add('WHERE TB_PENHOR_CEDULAR.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO');
    QPenhorCedularCons.SQL.Add('AND  TB_PENHOR_CEDULAR.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO  AND  TB_PENHOR_CEDULAR.COD_FILIAL = TB_FILIAL.COD_FILIAL');
    QPenhorCedularCons.SQL.Add('AND  TB_PENHOR_CEDULAR.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA');
    If Trim(METexto.Text) <> '' then
      QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.COD_PENHOR_CEDULAR = ' +Chr(39)+ Trim(METexto.Text) +Chr(39));
    If Trim(MECliente.Text) <> '' then
      QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.COD_CADASTRO = ' +Chr(39)+ Trim(MECliente.Text)+Chr(39) );
    If Trim(MEAnoSafra.Text) <> '/' then
      QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.DT_ANO_SAFRA = ' +Chr(39)+ Trim(MEAnoSafra.Text)+Chr(39) );
    If Trim(MEProduto.Text) <> '' then
      QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.COD_PRODUTO = ' +Chr(39)+ Trim(MEProduto.Text) +Chr(39));
    If RGSituacao.ItemIndex = 0 then
      QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.IND_SITUACAO = ' +Chr(39)+'ABERTO'+Chr(39) )
    ELSE
    BEGIN
      If RGSituacao.ItemIndex = 1 then
        QPenhorCedularCons.SQL.Add('AND TB_PENHOR_CEDULAR.IND_SITUACAO = ' +Chr(39)+ 'FECHADO' +Chr(39));
    END;
    QPenhorCedularCons.SQL.Add('ORDER BY  TB_PENHOR_CEDULAR.COD_PRODUTO,  TB_PENHOR_CEDULAR.DT_ANO_SAFRA,  TB_PENHOR_CEDULAR.IND_SITUACAO');
    }

    QPenhorCedularCons.Open;
  End;

end;

procedure TFPenhorCedularCons.BtnCadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
    MECliente.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MEClienteExit(sender);
  end;
end;

procedure TFPenhorCedularCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    MEProdutoExit(sender);
  end;
end;

procedure TFPenhorCedularCons.MEClienteExit(Sender: TObject);
begin
  inherited;
  If Trim(MECliente.Text) <> '' then
    EdCliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECliente.Text));
end;

procedure TFPenhorCedularCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//    Action := CaFree;
//    FPenhorCedularCons := nil;
end;

procedure TFPenhorCedularCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MEFilial.Text));
end;

procedure TFPenhorCedularCons.btnFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(sender);
  end;
end;

procedure TFPenhorCedularCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MEProduto.Text));
end;

end.
