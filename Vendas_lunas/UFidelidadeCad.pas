unit UFidelidadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, Db, ExtCtrls, DBCtrls, variants;

type
  TFFidelidadeCad = class(TForm)
    DBGrid1: TDBGrid;
    DSFidelidade: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    MECadastro: TMaskEdit;
    BtConsCadastro: TBitBtn;
    LBCadastro: TLabel;
    Label2: TLabel;
    SBProcurar: TSpeedButton;
    SBSair: TSpeedButton;
    LBFidelidade: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DSBaixaFidelidade: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    SBBaixa: TSpeedButton;
    Label11: TLabel;
    LblPontos: TLabel;
    BitBtn1: TBitBtn;
    MEFilial: TMaskEdit;
    Label12: TLabel;
    SBFilialCons: TSpeedButton;
    LBFilial: TLabel;
    SBRelatorio: TSpeedButton;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure MECadastroChange(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure SBProcurarClick(Sender: TObject);
    procedure SBBaixaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure MEFilialChange(Sender: TObject);
    procedure SBRelatorioClick(Sender: TObject);
    procedure MECadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    wValCompras:real;
    wValPagtoFidelidade:real;
  end;

var
  FFidelidadeCad: TFFidelidadeCad;

implementation

uses UCadastroCons, UOracle_cl, UCadastro_cl,UFidelidade_cl,
  UBaixaFidelidadeCad, UFilialCons, UFilial_cl, URFidelidade;

{$R *.DFM}

procedure TFFidelidadeCad.BtConsCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;   
end;

procedure TFFidelidadeCad.MECadastroChange(Sender: TObject);
begin
  if (trim(MECadastro.Text) <> '') then
  begin
    LBCadastro.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+trim(MECadastro.Text));
    LBFidelidade.Caption := DMOracle.BuscaNome('SELECT DT_CONSULTA_SINTEGRA FROM TB_CADASTRO','COD_CADASTRO = '+
                                                trim(MECadastro.Text));
  end;
end;

procedure TFFidelidadeCad.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFFidelidadeCad.SBProcurarClick(Sender: TObject);
begin
  wValCompras:=0;
  wValPagtoFidelidade:=0;
  if Trim(MECadastro.Text) = '' then
    raise exception.Create('É necessário Informar um Cliente');
  with DMFidelidade do
  begin
    QRFidelidade.Close;
    if trim(MECadastro.Text) <> '' then
      QRFidelidade.setVariable('COD_CADASTRO',trim(MECadastro.Text))
    else
      QRFidelidade.setVariable('COD_CADASTRO',null);

    if trim(MEFilial.Text) <> '' then
      QRFidelidade.SetVariable('FILIAL',trim(MeFilial.Text))
    else
      QRFidelidade.SetVariable('FILIAL',null);

    QRFidelidade.Open;

    QRFidelidade.first;
    while not(QRFidelidade.eof) do
    begin
      wValCompras:=wValCompras+QRFidelidadeVAL_TOTAL.Value;
      QRFidelidade.next;
    end;
    Label7.caption:=FormatFloat('#,##0.00',wValCompras);
    If wValCompras > 0 Then
       LblPontos.Caption := FormatFloat('#,##0',wValCompras * 10 );  // o calculo é a cada 25 reais 250 pontos

    //-----------abre query q Lista pagamentos de premios
    QRBaixaFidelidade.Close;
    if trim(MECadastro.Text) <> '' then
      QRBaixaFidelidade.setVariable('COD_CADASTRO',trim(MECadastro.Text))
    else
      QRBaixaFidelidade.setVariable('COD_CADASTRO',null);

    if trim(MEFilial.Text) <> '' then
      QRBaixaFidelidade.SetVariable('FILIAL',trim(MeFilial.Text))
    else
      QRBaixaFidelidade.SetVariable('FILIAL',null);

    QRBaixaFidelidade.Open;
    QRBaixaFidelidade.first;
    while not(QRBaixaFidelidade.eof) do
    begin
      wValPagtoFidelidade:=wValPagtoFidelidade+QRBaixaFidelidadeVAL_BAIXA.Value;
      QRBaixaFidelidade.next;
    end;
    Label8.caption:=FormatFloat('#,##0',wValPagtoFidelidade);
    //----label do saldo a retirar
    Label10.Caption:=FormatFloat('#,##0',wValCompras * 10 - wValPagtoFidelidade);

    if ((wValCompras * 10 - wValPagtoFidelidade) > 0) then
      SBBaixa.Enabled:=true
    else
      SBBaixa.Enabled:=false;
  end;
end;

procedure TFFidelidadeCad.SBBaixaClick(Sender: TObject);
begin

  if FPagamentoFidelidadeCad = nil then
    FPagamentoFidelidadeCad:= TFPagamentoFidelidadeCad.create(application);
  FPagamentoFidelidadeCad.Label2.Caption := LbCadastro.Caption;
  FPagamentoFidelidadeCad.showmodal;
end;

procedure TFFidelidadeCad.BitBtn1Click(Sender: TObject);
begin
  with DMFidelidade do
  begin
    QBaixaFidelidade.Close;
    QBaixaFidelidade.SetVariable('Pk',QrBaixaFidelidadeCod_Baixa_Fidelidade.Value);
    QBaixaFidelidade.Open;
    QBaixaFidelidade.Delete;
    QBaixaFidelidade.Close;
    FFidelidadeCad.SBProcurar.Click;
  end;

end;

procedure TFFidelidadeCad.SBFilialConsClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFFidelidadeCad.MEFilialChange(Sender: TObject);
begin
  if (trim(MEFilial.Text) <> '') then
    LBFilial.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+trim(MEFilial.Text)); 
end;

procedure TFFidelidadeCad.SBRelatorioClick(Sender: TObject);
begin
  if MECadastro.Text = '' then
    raise exception.Create('É necessário Informar um Cliente');
  With DMFidelidade do
  Begin
    QRPontosCliente.Close;
    If Trim(FFidelidadeCad.MEFilial.Text)= ''   then
      QRPontosCliente.SetVariable('FILIAL',Null)
    Else
      QRPontosCliente.SetVariable('FILIAL',FFidelidadeCad.MEFilial.Text);

    If Trim(FFidelidadeCad.MECadastro.Text)= ''   then
      QRPontosCliente.SetVariable('CADASTRO',Null)
    Else
      QRPontosCliente.SetVariable('CADASTRO',FFidelidadeCad.MECadastro.Text);
    QRPontosCliente.Open;
    If FRFidelidade = Nil then
      FRFidelidade := TFRFidelidade.Create(Application);
    FRFidelidade.QRLFilial.Caption := FFidelidadeCad.LBFilial.Caption;
    FRFidelidade.QRPrimario.Preview;
    QRPontosCliente.Close;
  End;

end;

procedure TFFidelidadeCad.MECadastroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If key = 123 Then  //123 = F12
        BtConsCadastro.Click;
end;

end.
