unit UOrdemServicoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFOrdemServicoCad = class(TFTCadSimples)
    PCOrdemServico: TPageControl;
    TSCab: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBMemo2: TDBMemo;
    BtConsCadastro: TBitBtn;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    BtConsProduto: TBitBtn;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    SpeedButton2: TSpeedButton;
    SBFechaOS: TSpeedButton;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    BtConsTecnico: TBitBtn;
    DBEdit19: TDBEdit;
    RelSinttico1: TMenuItem;
    RelAnaltico1: TMenuItem;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    MdiaAtendimento1: TMenuItem;
    Recibo1: TMenuItem;
    OSemAberto1: TMenuItem;
    DBEdit6: TDBEdit;
    DBEdit21: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBFechaOSClick(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsTecnicoClick(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure RelSinttico1Click(Sender: TObject);
    procedure RelAnaltico1Click(Sender: TObject);
    procedure MdiaAtendimento1Click(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure OSemAberto1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemServicoCad: TFOrdemServicoCad;

implementation

uses UOrdemServico_cl, UOrdemServicoCons, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UOracle_cl, UOrdemServicoFecha,
  UROrdemServico_Entrada, UFilialCons, UFilial_cl, UVendedorCons,
  UVendedor_cl, UROrdemServico_Saida, UOrdemServicoParam,
  UROrdemServico_Sintetico, UROrdemServico_Analitico, UROrdemServico_Media,
  UROrdemServico_Aberto, UReciboParam;

{$R *.DFM}

procedure TFOrdemServicoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FOrdemServicoCons = Nil then
    FOrdemServicoCons := TFOrdemServicoCons.Create(Application);
  If FOrdemServicoCons.ShowModal = mrOk then
  With DMOrdemServico do
  Begin
    QOrdemServico.Close;
    QOrdemServico.ParamByName('PK').AsFloat := QOrdemServicoConsCod_Ordem_Servico_Cab.Value;    
    QOrdemServico.Open;
  End;
end;

procedure TFOrdemServicoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  Begin
    QOrdemServico.Open;
    QOrdemServicoIt.Open;
  End;
  PCOrdemServico.ActivePage := TSCab
end;

procedure TFOrdemServicoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMOrdemServico.QOrdemServicoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFOrdemServicoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMOrdemServico.QOrdemServicoItCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
    DMOrdemServico.QOrdemServicoIt.Edit;
  End;
end;

procedure TFOrdemServicoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOrdemServicoCad.SBFechaOSClick(Sender: TObject);
begin
  inherited;
  If DMOrdemServico.QOrdemServicoDt_Saida.Value > 0 Then
    Raise Exception.Create('Ordem de Serviço já fechada');
  If FOrdemServicoFecha = Nil Then
    FOrdemServicoFecha := TFOrdemServicoFecha.Create(Application);
  FOrdemServicoFecha.PCFecha.Pages[0].TabVisible := True;
  If FOrdemServicoFecha.ShowModal = mrOk Then
  Begin
  
  End;
end;

procedure TFOrdemServicoCad.Entrada1Click(Sender: TObject);
begin
  inherited;
  If FROrdemServico_Entrada = Nil Then
    FROrdemServico_Entrada := TFROrdemServico_Entrada.Create(Application);
  DMOrdemServico.QREntrada.Open;
  FROrdemServico_Entrada.QRPrimario.Preview;
  DMOrdemServico.QREntrada.Close;
end;

procedure TFOrdemServicoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMOrdemServico.QOrdemServicoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFOrdemServicoCad.BtConsTecnicoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMOrdemServico.QOrdemServicoCod_Tecnico.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFOrdemServicoCad.Sada1Click(Sender: TObject);
begin
  inherited;
  If FROrdemServico_Saida = Nil Then
    FROrdemServico_Saida := TFROrdemServico_Saida.Create(Application);
  DMOrdemServico.QREntrada.Open;
  DMOrdemServico.QRSaida.Close;
  DMOrdemServico.QRSaida.ParamByName('COD_ORDEM_SERVICO_CAB').AsFloat := DMOrdemServico.QOrdemServicoCOD_ORDEM_SERVICO_CAB.VALUE;
  DMOrdemServico.QRSaida.Open;
//  DMOrdemServico.QRSaida_Receber.Open;
  If (DMOrdemServico.QREntradaDt_Saida.Value <> 0)
    or ( MessageDlg('Ordem de Serviço ainda não foi fechada!'
           +#13+'Imprimir mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes) Then
    FROrdemServico_Saida.QRPrimario.Preview;
  DMOrdemServico.QREntrada.Close;
  DMOrdemServico.QRSaida.Close;
 // DMOrdemServico.QRSaida_Receber.Close;
end;

procedure TFOrdemServicoCad.RelSinttico1Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[0].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRSintetico.Close;
    QRSintetico.ParamByName('DATA_I').AsDate := StrToDate(FordemServicoParam.ME0DataI.Text);
    QRSintetico.ParamByName('DATA_F').AsDate := StrToDate(FordemServicoParam.ME0DataF.Text);
    If Trim(FordemServicoParam.ME0Filial.Text) = '' Then
      QRSintetico.ParamByName('FILIAL').Clear
    Else
      QRSintetico.ParamByName('FILIAL').AsFloat := StrToFloat(FordemServicoParam.ME0Filial.Text);
    If Trim(FordemServicoParam.ME0Cadastro.Text) = '' Then
      QRSintetico.ParamByName('CADASTRO').Clear
    Else
      QRSintetico.ParamByName('CADASTRO').AsFloat := StrToFloat(FordemServicoParam.ME0Cadastro.Text);
    QRSintetico.Open;
    If FROrdemServico_Sintetico = Nil Then
      FROrdemServico_Sintetico := TFROrdemServico_Sintetico.Create(Application);
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FROrdemServico_Sintetico.QRPrimario.Preview
    Else
      FROrdemServico_Sintetico.QRPrimario.Print;
  End;
end;

procedure TFOrdemServicoCad.RelAnaltico1Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[1].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRAnalitico.Close;
    QRAnalitico.ParamByName('DATA_I').AsDate := StrToDate(FordemServicoParam.ME1DataI.Text);
    QRAnalitico.ParamByName('DATA_F').AsDate := StrToDate(FordemServicoParam.ME1DataF.Text);
    If Trim(FordemServicoParam.ME1Filial.Text) = '' Then
      QRAnalitico.ParamByName('FILIAL').Clear
    Else
      QRAnalitico.ParamByName('FILIAL').AsFloat := StrToFloat(FordemServicoParam.ME1Filial.Text);
    If Trim(FordemServicoParam.ME1Cadastro.Text) = '' Then
      QRAnalitico.ParamByName('CADASTRO').Clear
    Else
      QRAnalitico.ParamByName('CADASTRO').AsFloat := StrToFloat(FordemServicoParam.ME1Cadastro.Text);
    QRAnalitico.Open;
    If FROrdemServico_Analitico = Nil Then
      FROrdemServico_Analitico := TFROrdemServico_Analitico.Create(Application);
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FROrdemServico_Analitico.QRPrimario.Preview
    Else
      FROrdemServico_Analitico.QRPrimario.Print;
  End;
end;

procedure TFOrdemServicoCad.MdiaAtendimento1Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[2].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRMedia.Close;
    QRMedia.ParamByName('DATA_I').AsDate := StrToDate(FordemServicoParam.ME2DataI.Text);
    QRMedia.ParamByName('DATA_F').AsDate := StrToDate(FordemServicoParam.ME2DataF.Text);
    If Trim(FordemServicoParam.ME2Filial.Text) = '' Then
      QRMedia.ParamByName('FILIAL').Clear
    Else
      QRMedia.ParamByName('FILIAL').AsFloat := StrToFloat(FordemServicoParam.ME2Filial.Text);
    QRMedia.Open;
    If FROrdemServico_Media = Nil Then
      FROrdemServico_Media := TFROrdemServico_Media.Create(Application);
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FROrdemServico_Media.QRPrimario.Preview
    Else
      FROrdemServico_Media.QRPrimario.Print;
  End;
end;

procedure TFOrdemServicoCad.Recibo1Click(Sender: TObject);
begin
  inherited;
  If FReciboParam = Nil Then
    FReciboParam := TFReciboParam.Create(Application);
  FReciboParam.ShowModal;
end;

procedure TFOrdemServicoCad.OSemAberto1Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[3].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRAberto.Close;
    If Trim(FordemServicoParam.ME3Filial.Text) = '' Then
      QRAberto.ParamByName('FILIAL').Clear
    Else
      QRAberto.ParamByName('FILIAL').AsFloat := StrToFloat(FordemServicoParam.ME3Filial.Text);
    QRAberto.ParamByName('DATA_I').AsDate := StrToDate(FordemServicoParam.ME3DataI.Text);
    QRAberto.ParamByName('DATA_F').AsDate := StrToDate(FordemServicoParam.ME3DataF.Text);
    QRAberto.Open;
    If FROrdemServico_Aberto = Nil Then
      FROrdemServico_Aberto := TFROrdemServico_Aberto.Create(Application);
    FROrdemServico_Aberto.QRLTitulo.Caption := 'Assistencia Tecnica de '+ FordemServicoParam.ME3DataI.Text+' até '+FordemServicoParam.ME3DataF.Text;
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FROrdemServico_Aberto.QRPrimario.Preview
    Else
      FROrdemServico_Aberto.QRPrimario.Print;
  End;
end;

procedure TFOrdemServicoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFechaOS.Enabled := DMOrdemServico.QOrdemServico.State = dsBrowse;
  BtConsFilial.Enabled := Not SBFechaOS.Enabled;
  BtConsTecnico.Enabled := Not SBFechaOS.Enabled;
  BtConsCadastro.Enabled := Not SBFechaOS.Enabled;
  BtConsProduto.Enabled := Not SBFechaOS.Enabled;
end;

end.
