unit ULimpezaPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFLimpezaPedidos = class(TFTCadSimples)
    Label21: TLabel;
    MeFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MeFilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaPedidos: TFLimpezaPedidos;

implementation

uses ULimpeza_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFLimpezaPedidos.MeFilialExit(Sender: TObject);
begin
  inherited;
 If Trim(MeFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MeFilial.Text))
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFLimpezaPedidos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(MeFilial.Text) = '' Then
     Raise Exception.Create('Preencher Código Filial');

  If Trim(MeDataI.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(MeDataF.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  With DMLimpeza do
  Begin
    QLimpeza_pedido_Cab.Close;
    If Trim(MeFilial.Text) = '' Then
       QLimpeza_pedido_Cab.SetVariable('Cod_Filial',Null)
    Else
       QLimpeza_pedido_Cab.SetVariable('Cod_Filial',Trim(MeFilial.Text));
    QLimpeza_pedido_Cab.SetVariable('Dt_Inicio',Trim(MeDataI.Text));
    QLimpeza_pedido_Cab.SetVariable('Dt_Fim',Trim(MeDataf.Text));

    QLimpeza_pedido_Cab.Open;
    QLimpeza_pedido_item.Open;
    QAcessa_Embarque_Item.Open;
    QLimpeza_Embarque_Cab.Open;
    QLimpeza_Embarque_Item.Open;
    QLimpeza_Controle_Carga.Open;
    QLimpeza_Baixa_Pedido.Open;
    QLimpezaMaterial_Pedido.Open;
    QPedidoCancelado.Open;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not(QLimpeza_Pedido_Cab.Eof) Do
       Begin
         While not(QLimpeza_Controle_Carga.Eof) Do
           QLimpeza_Controle_Carga.Delete;
         While not(QLimpeza_Embarque_Item.Eof) Do
           QLimpeza_Embarque_Item.Delete;
         While not(QLimpeza_Embarque_Cab.Eof) Do
           QLimpeza_Embarque_Cab.Delete;
         While not(QLimpeza_pedido_item.Eof) Do
          Begin
            While not(QLimpeza_Baixa_Pedido.Eof) Do
              QLimpeza_Baixa_Pedido.Delete;
            While not(QLimpezaMaterial_Pedido.Eof) Do
              QLimpezaMaterial_Pedido.Delete;
            While not(QPedidoCancelado.Eof) Do
              QPedidoCancelado.Delete;
            QLimpeza_pedido_item.Delete;
          End;
         QLimpeza_pedido_Cab.Delete;
       End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;
    QLimpeza_pedido_Cab.Close;
    QLimpeza_pedido_item.Close;
    QAcessa_Embarque_Item.Close;
    QLimpeza_Embarque_Cab.Close;
    QLimpeza_Embarque_Item.Close;
    QLimpeza_Controle_Carga.Close;
    QLimpeza_Baixa_Pedido.Close;
    QLimpezaMaterial_Pedido.Close;
    QPedidoCancelado.Close;
  End;

end;

procedure TFLimpezaPedidos.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

end.
