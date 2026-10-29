unit UVendaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, IBUpdateSQL, Menus;

type
  TFVendaCons = class(TFPadraoConsulta)
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    MeCodOperador: TMaskEdit;
    EOperador: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    MeCodCliente: TMaskEdit;
    ECliente: TEdit;
    MeDataIni: TMaskEdit;
    Label2: TLabel;
    MeDataFin: TMaskEdit;
    Label3: TLabel;
    QConsultaCOD_VENDA: TIntegerField;
    QConsultaDT_VENDA: TDateField;
    QConsultaCOD_CLIENTE: TIntegerField;
    QConsultaCOD_OPERADOR: TIntegerField;
    QConsultaDESC_OBSERVACAO: TIBStringField;
    QConsultaDESC_NOME_CLIENTE: TIBStringField;
    QConsultaDESC_NOME_OPERADOR: TIBStringField;
    MeTelefone: TMaskEdit;
    QConsultaVAL_VENDA: TFloatField;
    BtnReemitirTickets: TBitBtn;
    BitBtn1: TBitBtn;
    UConsulta: TIBUpdateSQL;
    QConsultaVAL_TAXA_TOTAL: TFloatField;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    MeCodTipo: TMaskEdit;
    ETipo: TEdit;
    RgTaxa: TRadioGroup;
    QConsultaval_total: TFloatField;
    PopupMenu1: TPopupMenu;
    RelatriodeVendas1: TMenuItem;
    RelatriodeVendasporTipodeProduto1: TMenuItem;
    QConsultaQT_QUANTIDADE: TFloatField;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    QConsultaItens: TIBQuery;
    QConsultaItensCOD_VENDA: TIntegerField;
    QConsultaItensCOD_VENDA_ITEM: TIntegerField;
    QConsultaItensCOD_PRODUTO: TIntegerField;
    QConsultaItensVAL_PRECO: TFloatField;
    QConsultaItensQT_QUANTIDADE: TFloatField;
    QConsultaItensDESC_PRODUTO: TIBStringField;
    DsConsultaItens: TDataSource;
    QConsultaItensval_total: TCurrencyField;
    CbMostrar: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MeTelefoneEnter(Sender: TObject);
    procedure MeTelefoneExit(Sender: TObject);
    procedure MeCodOperadorExit(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure MeCodOperadorChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MeTelefoneChange(Sender: TObject);
    procedure BtnReemitirTicketsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeCodTipoChange(Sender: TObject);
    procedure MeCodTipoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure QConsultaCalcFields(DataSet: TDataSet);
    procedure RelatriodeVendas1Click(Sender: TObject);
    procedure QConsultaItensCalcFields(DataSet: TDataSet);
    procedure CbMostrarClick(Sender: TObject);
    procedure RelatriodeVendasporTipodeProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaCons: TFVendaCons;

implementation

uses UOperadorCad, UDmSistema, UFuncoes, UDmCliente, UClienteCad,
  UTipoProdutoCad, UDmVenda_Nova, URVendaCons, URVendaConsTipoProduto;

{$R *.dfm}

procedure TFVendaCons.FormShow(Sender: TObject);
begin
  inherited;
  MeDataIni.Text := FormatDateTime('dd/MM/yyyy', Date);
  MeDataFin.Text := FormatDateTime('dd/MM/yyyy', Date);
  MeTelefone.Text := '(45) ';

  CbMostrar.Align := alBottom;
end;

procedure TFVendaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFOperadorCad, FOperadorCad);
  FOperadorCad.Consultando := True;
  FOperadorCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodOperador.Text := IntToStr(RetornoConsulta)
  else
    MeCodOperador.Clear;

  MeCodOperador.SetFocus;
end;

procedure TFVendaCons.MeTelefoneEnter(Sender: TObject);
begin
  inherited;
  MeTelefone.SelStart := 5;
  MeTelefone.SelLength := 9;
  MeTelefone.Refresh;
end;

procedure TFVendaCons.MeTelefoneExit(Sender: TObject);
begin
  inherited;
  if ((Trim(MeTelefone.Text) = '(  )     -') or (Trim(MeTelefone.Text) = '(45)     -')) then
  Begin
    MeCodCliente.Clear;
    ECliente.Text := 'TODOS';
  End
  Else
  Begin
    DmCliente.QTelCadastrado.Close;
    DmCliente.QTelCadastrado.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
    DmCliente.QTelCadastrado.Open;

    MeCodCliente.Text := IntToStr(DmCliente.QTelCadastradoCOD_CLIENTE.Value);
    ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
  End;
end;

procedure TFVendaCons.MeCodOperadorExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodOperador.Text) = '' then
    EOperador.Text := 'TODOS';
end;

procedure TFVendaCons.BtnPesquisarClick(Sender: TObject);
begin
  QConsulta.Close;
  if ECliente.Text = 'TODOS' then
    QConsulta.ParamByName('PCOD_CLIENTE').AsInteger := 0
  else
    QConsulta.ParamByName('PCOD_CLIENTE').AsInteger := StrToInt(Trim(MeCodCliente.Text));
  if EOperador.Text = 'TODOS' then
    QConsulta.ParamByName('PCOD_OPERADOR').AsInteger := 0
  else
    QConsulta.ParamByName('PCOD_OPERADOR').AsInteger := StrToInt(Trim(MeCodOperador.Text));
  if ETipo.Text = 'TODOS' then
    QConsulta.ParamByName('PCOD_TIPO_PRODUTO').AsInteger := 0
  else
    QConsulta.ParamByName('PCOD_TIPO_PRODUTO').AsInteger := StrToInt(Trim(MeCodTipo.Text));
  QConsulta.ParamByName('PDT_VENDA_INI').AsDate := StrToDate(Trim(MeDataIni.Text));
  QConsulta.ParamByName('PDT_VENDA_FIN').AsDate := StrToDate(Trim(MeDataFin.Text));
  QConsulta.ParamByName('PTAXA').AsInteger := RgTaxa.ItemIndex;
  QConsulta.Open;

  QConsultaItens.Close;
  QConsultaItens.Params := QConsulta.Params;
  if CbMostrar.Checked then
    QConsultaItens.ParamByName('VENDA_COMPLETA').AsInteger := 1
  else
    QConsultaItens.ParamByName('VENDA_COMPLETA').AsInteger := 0;
  QConsultaItens.Open;
  inherited;

end;

procedure TFVendaCons.MeCodOperadorChange(Sender: TObject);
begin
  inherited;
  if MeCodOperador.Text <> '' then
    EOperador.Text := BuscaString('DESC_NOME', 'TB_OPERADOR', 'COD_OPERADOR', StrToInt(MeCodOperador.Text))
  else
    EOperador.Text := 'TODOS';
end;

procedure TFVendaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.Consultando := True;
  FClienteCad.ShowModal;

  if RetornoConsulta > -1 then
  Begin
    MeCodCliente.Text := IntToStr(RetornoConsulta);
    MeTelefone.Text := BuscaString('DESC_TELEFONE', 'TB_CLIENTE', 'COD_CLIENTE', RetornoConsulta);
  End
  else
  Begin
    MeCodCliente.Clear;
    MeTelefone.Text := '(45)     -    ';
  End;

  MeTelefone.SetFocus;
end;

procedure TFVendaCons.MeTelefoneChange(Sender: TObject);
begin
  inherited;
  DmCliente.QTelCadastrado.Close;
  DmCliente.QTelCadastrado.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
  DmCliente.QTelCadastrado.Open;

  MeCodCliente.Text := IntToStr(DmCliente.QTelCadastradoCOD_CLIENTE.Value);
  ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
end;

procedure TFVendaCons.BtnReemitirTicketsClick(Sender: TObject);
begin
  inherited;
  ImprimeTicket(QConsultaCOD_VENDA.Value, 'COZINHA');
  ImprimeTicket(QConsultaCOD_VENDA.Value);
end;

procedure TFVendaCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if QConsulta.IsEmpty then Exit;
  if (MessageDlg('Deseja realmente cancelar esta venda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  Begin
    DmSistema.TSistema.CommitRetaining;
    QConsulta.Delete;
    DmSistema.TSistema.CommitRetaining;
  End;
end;

procedure TFVendaCons.MeCodTipoChange(Sender: TObject);
begin
  inherited;
  if MeCodTipo.Text <> '' then
    ETipo.Text := BuscaString('DESC_TIPO_PRODUTO', 'TB_TIPO_PRODUTO', 'COD_TIPO_PRODUTO', StrToInt(MeCodTipo.Text))
  else
    ETipo.Text := 'TODOS';
end;

procedure TFVendaCons.MeCodTipoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodTipo.Text) = '' then
    ETipo.Text := 'TODOS';
end;

procedure TFVendaCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFTipoProdutoCad, FTipoProdutoCad);
  FTipoProdutoCad.Consultando := True;
  FTipoProdutoCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodTipo.Text := IntToStr(RetornoConsulta)
  else
    MeCodTipo.Clear;

  MeCodTipo.SetFocus;
end;

procedure TFVendaCons.BtnImprimirClick(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFVendaCons.QConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  QConsultaval_total.Value := QConsultaVAL_VENDA.Value + QConsultaVAL_TAXA_TOTAL.Value;
end;

procedure TFVendaCons.RelatriodeVendas1Click(Sender: TObject);
begin
  inherited;
  BtnPesquisar.Click;

  Application.CreateForm(TFRVendaCons, FRVendaCons);
  FRVendaCons.QRPrimario.Preview;
end;

procedure TFVendaCons.QConsultaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QConsultaItensval_total.Value := QConsultaItensVAL_PRECO.Value + QConsultaItensval_total.Value;
end;

procedure TFVendaCons.CbMostrarClick(Sender: TObject);
begin
  inherited;
  QConsultaItens.Close;
  QConsultaItens.Params := QConsulta.Params;
  if CbMostrar.Checked then
    QConsultaItens.ParamByName('VENDA_COMPLETA').AsInteger := 1
  else
    QConsultaItens.ParamByName('VENDA_COMPLETA').AsInteger := 0;
  QConsultaItens.Open;
end;

procedure TFVendaCons.RelatriodeVendasporTipodeProduto1Click(
  Sender: TObject);
begin
  inherited;
  DmVenda_Nova.QConsVendaTipoProd.Close;
  DmVenda_Nova.QConsVendaTipoProd.Params := QConsulta.Params;
  DmVenda_Nova.QConsVendaTipoProd.Open;

  Application.CreateForm(TFRVendaConsTipoProduto, FRVendaConsTipoProduto);
  FRVendaConsTipoProduto.QRPrimario.Preview;
end;

end.
