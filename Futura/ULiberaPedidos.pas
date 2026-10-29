unit ULiberaPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, variants;

type
  TFLiberaPedidos = class(TFTCadSimples)
    Label1: TLabel;
    MeVendedor: TMaskEdit;
    SbVendedor: TSpeedButton;
    Label2: TLabel;
    MeDtInicial: TMaskEdit;
    Label3: TLabel;
    MeDtFinal: TMaskEdit;
    BtProcura: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DsPedidoCab: TDataSource;
    DsPedidoItens: TDataSource;
    PedidosPCidadeeVendedor1: TMenuItem;
    PedidoscomProblemadePreo1: TMenuItem;
    Label4: TLabel;
    MeCodFilial: TMaskEdit;
    procedure SbVendedorClick(Sender: TObject);
    procedure BtProcuraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PedidosPCidadeeVendedor1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PedidoscomProblemadePreo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaPedidos: TFLiberaPedidos;

implementation

uses UVendedorCons, UVendedor_cl, ULiberaPedidos_cl, UOracle_cl,
  ULiberaPedidosParam, UrPedidosVendedorCidade, URPedidosProblemaPreco,
  UUsuario_cl;

{$R *.DFM}

procedure TFLiberaPedidos.SbVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
     FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = MrOk Then
     MeVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFLiberaPedidos.BtProcuraClick(Sender: TObject);
begin
  inherited;
  With DMLiberaPedidos Do
  Begin
    QPedidosPendentes.Close;
    QPedidosPendentes.SetVariable('Dt_Emissao_Inic',MeDtInicial.Text);
    QPedidosPendentes.SetVariable('Dt_Emissao_Fim',MeDtFinal.Text);
    QPedidosPendentes.SetVariable('Cod_Filial',Trim(MeCodFilial.Text));
    If Trim(MeVendedor.Text) = '' Then
       QPedidosPendentes.SetVariable('Cod_Vendedor',Null)
    Else
       QPedidosPendentes.SetVariable('Cod_Vendedor',Trim(MeVendedor.Text));
    QPedidosPendentes.Open;
  End;
end;

procedure TFLiberaPedidos.FormActivate(Sender: TObject);
begin
  inherited;
  MeCodFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  DMLiberaPedidos.QPedidoItens.Open;
end;

procedure TFLiberaPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMLiberaPedidos.QPedidoItens.Close;
end;

procedure TFLiberaPedidos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  With DMOracle Do
  Begin
    QExecSql.Close;
    QExecSql.Sql.Text := '';
    QExecSql.Sql.Add('Update Tb_Pedido_Cab Set Ind_Liberado = ' + Chr(39) + 'SIM' + Chr(39));
    QExecSql.Sql.Add(' Where Cod_Pedido_Cab = ' + DMLiberaPedidos.QPedidosPendentesCod_Pedido_Cab.Text);
    QExecSql.execSQL;
  End;
end;

procedure TFLiberaPedidos.PedidosPCidadeeVendedor1Click(Sender: TObject);
begin
  inherited;
  if FLiberaPedidosParam = Nil then
     FLiberaPedidosParam := TFLiberaPedidosParam.Create(Application);
  FLiberaPedidosParam.PGRelatorio.Pages[0].TabVisible := True;
  if FLiberaPedidosParam.ShowModal = mrOk then
  Begin
    If ( Trim(FLiberaPedidosParam.ME1DtInicial.Text) = '') OR (Trim(FLiberaPedidosParam.ME1DtFinal.Text)='') Then
      raise Exception.Create('É necessário informar um período');
    with DMLiberaPedidos do
    begin
      QrPedidosCidade.Close;
      QrPedidosCidade.SetVariable('DT_INICIAL',FLiberaPedidosParam.ME1DtInicial.Text);
      QrPedidosCidade.SetVariable('DT_FINAL',FLiberaPedidosParam.ME1DtFinal.Text);
      if Trim(FLiberaPedidosParam.ME1Filial.Text) = '' then
        QrPedidosCidade.SetVariable('COD_FILIAL',Null)
      else
        QrPedidosCidade.SetVariable('COD_FILIAL',FLiberaPedidosParam.ME1Filial.Text);
      if Trim(FLiberaPedidosParam.Me1Vendedor.Text) = '' then
        QrPedidosCidade.SetVariable('COD_VENDEDOR',Null)
      else
        QrPedidosCidade.SetVariable('COD_VENDEDOR',FLiberaPedidosParam.Me1Vendedor.Text);

      if Trim(FLiberaPedidosParam.ME1Departamento.Text) = '' then
        QrPedidosCidade.SetVariable('COD_DEPARTAMENTO',Null)
      else
        QrPedidosCidade.SetVariable('COD_DEPARTAMENTO',FLiberaPedidosParam.ME1Departamento.Text);

      if Trim(FLiberaPedidosParam.Me1Cidade.Text) = '' then
        QrPedidosCidade.SetVariable('DESC_CIDADE',Null)
      else
        QrPedidosCidade.SetVariable('DESC_CIDADE',FLiberaPedidosParam.ED1Cidade.Text);
      QrPedidosCidade.Sql[QrPedidosCidade.Sql.Count - 1] := '';
      Case FLiberaPedidosParam.Rg1Opcao.ItemIndex Of
       0 : QrPedidosCidade.Sql.Add(' And tb_Pedido_cab.Ind_Liberado = ' + Chr(39) + 'SIM' + Chr(39) + ' AND Num_Palm IS NOT NULL Order By Tb_pedido_Cab.Cod_Vendedor,Tb_Cadastro.Desc_Cidade,Tb_pedido_Cab.Num_Pedido');
       1 : QrPedidosCidade.Sql.Add(' And tb_Pedido_cab.Ind_Liberado = ' + Chr(39) + 'NAO' + Chr(39) + ' AND Num_Palm IS NOT NULL Order By Tb_pedido_Cab.Cod_Vendedor,Tb_Cadastro.Desc_Cidade,Tb_pedido_Cab.Num_Pedido');
       2 : QrPedidosCidade.Sql.Add(' Order By Tb_pedido_Cab.Cod_Vendedor,Tb_Cadastro.Desc_Cidade,Tb_pedido_Cab.Num_Pedido');
      End; 
      QrPedidosCidade.Open;
      if FrPedidosVendedorCidade = Nil then
        FrPedidosVendedorCidade := TFrPedidosVendedorCidade.Create(Application);
      FrPedidosVendedorCidade.QRLPeriodo.Caption := 'Pedidos no periodo ('+FLiberaPedidosParam.ME1DtInicial.text+' - '+FLiberaPedidosParam.ME1DtFinal.Text+')';

      if FLiberaPedidosParam.RGPreview.ItemIndex = 0 then
        FrPedidosVendedorCidade.QRPrimario.Preview
      else
        FrPedidosVendedorCidade.QRPrimario.Print;
      QrPedidosCidade.Close;
    End;
  End;
End;

procedure TFLiberaPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
{  If Column.FieldName = 'COD_CADASTRO' Then
     if Column.Field.Value = 50 Then
        Column.Color := Clred
     else
        Column.Color := ClWindow;
 }
end;

procedure TFLiberaPedidos.PedidoscomProblemadePreo1Click(Sender: TObject);
begin
  inherited;
  If FLiberaPedidosParam = Nil then
     FLiberaPedidosParam := TFLiberaPedidosParam.Create(Application);
  FLiberaPedidosParam.PGRelatorio.Pages[1].TabVisible := True;
  If FLiberaPedidosParam.ShowModal = MrOk then
  begin
    DMLiberaPedidos.QRPedidosProblemaPreco.Close;
    if trim(FLiberaPedidosParam.Me0Vendedor.Text) <> '' then
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('COD_VENDEDOR', strtoint(trim(FLiberaPedidosParam.Me0Vendedor.Text)))
    else
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('COD_VENDEDOR', null);

    if trim(FLiberaPedidosParam.Me0Filial.Text) <> '' then
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('COD_FILIAL', strtoint(trim(FLiberaPedidosParam.Me0Filial.Text)))
    else
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('COD_FILIAL', null);

    if trim(FLiberaPedidosParam.Me0DtInicial.Text) <> '' then
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('DT_INICIO', strtoDate(trim(FLiberaPedidosParam.Me0DtInicial.Text)))
    else
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('DT_INICIO', null);

    if trim(FLiberaPedidosParam.Me0DtFinal.Text) <> '' then
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('DT_FIM', strtoDate(trim(FLiberaPedidosParam.Me0DtFinal.Text)))
    else
      DMLiberaPedidos.QRPedidosProblemaPreco.SetVariable('DT_FIM', null);

    DMLiberaPedidos.QRPedidosProblemaPreco.Open;

    if FRPedidosProblemaPreco = nil then
      FRPedidosProblemaPreco := TFRPedidosProblemaPreco.create(application);

    FRPedidosProblemaPreco.QRLVendedor.Caption := 'Vendedor: ' + FLiberaPedidosParam.ed0Vendedor.Text;
    FRPedidosProblemaPreco.QRLFilial.Caption := 'Filial: ' + FLiberaPedidosParam.ed0Filial.Text;
    FRPedidosProblemaPreco.QRLPeriodo.Caption := 'Período: ' + FLiberaPedidosParam.Me0DtInicial.Text + ' a ' + FLiberaPedidosParam.Me0DtFinal.Text;              

    If FLiberaPedidosParam.RGPreview.ItemIndex = 0 then
      FRPedidosProblemaPreco.QRPrimario.Preview
    else
      FRPedidosProblemaPreco.QRPrimario.Print;
    DMLiberaPedidos.QRPedidosProblemaPreco.Close;
  end;
end;

end.
