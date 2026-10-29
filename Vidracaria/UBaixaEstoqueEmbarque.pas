unit UBaixaEstoqueEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFBaixaEstoquePeloEmbarque = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Me7Embarque: TMaskEdit;
    Bt7Embarque: TBitBtn;
    Ed7Embarque: TEdit;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Bt7EmbarqueClick(Sender: TObject);
    procedure Me7EmbarqueExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me7EmbarqueChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaEstoquePeloEmbarque: TFBaixaEstoquePeloEmbarque;

implementation

uses UEmbarqueCons, UEmbarque_cl, UOracle_cl, UEstoque_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFBaixaEstoquePeloEmbarque.Bt7EmbarqueClick(Sender: TObject);
begin
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me7Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed7Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;
end;

procedure TFBaixaEstoquePeloEmbarque.Me7EmbarqueExit(Sender: TObject);
begin
  If Trim(Me7Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me7Embarque.Text));
    QEmbarque.Open;
    Ed7Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed7Embarque.Text := 'Deve Ser Informado Embarque';

   Label2.Caption:=DMOracle.BuscaNome(
   'SELECT '+
      'SUM(Tb_pedido_item.QT_PEDIDO - Tb_pedido_item.QT_CANCELADO) AS SQT_PEDIDO '+
   'FROM '+
     'TB_EMBARQUE, '+
  'TB_EMBARQUE_ITEM, '+
  'TB_PEDIDO_CAB, '+
  'TB_PEDIDO_ITEM '
  ,
  'Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE '+
  'AND '+
  'Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB '+
  'AND '+
  'Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB '+
  'AND '+
  'TB_EMBARQUE.COD_EMBARQUE = '+Trim(Me7Embarque.Text));

end;

procedure TFBaixaEstoquePeloEmbarque.BitBtn1Click(Sender: TObject);
Var wFilial : Integer;
begin
  With DMEmbarque do
  Begin
    QEmbarqueItensNota.Close;
    If Trim(FBaixaEstoquePeloEmbarque.Me7Embarque.Text) <> '' then
      QEmbarqueItensNota.SetVariable('COD_EMBARQUE',Trim(FBaixaEstoquePeloEmbarque.Me7Embarque.Text))
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    QEmbarque.Close;
    QEmbarque.SetVariable('Pk',StrToInt(Trim(FBaixaEstoquePeloEmbarque.Me7Embarque.Text)));
    QEmbarque.Open;
    If QEmbarqueInd_Atualiza_Estoque.Value = 'SIM' Then
      Raise Exception.Create ('Este Embarque Já Foi Atualizado Estoque');
    QEmbarqueItensNota.Open;
    QEmbarqueItensNota.First;
    if QEmbarqueItensNota.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QEmbarqueItensNota.Eof Do
        Begin
          wFilial := QEmbarqueItensNotaCod_Filial.Value;
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then // para zadimel sempre filial 1
             wFilial := 1;
          DmEstoque.Atualiza_Estoque(-1,wFilial,QEmbarqueItensNotaCod_Produto.Value,1,
                                    (QEmbarqueItensNotaQt_Quantidade.Value*-1), 0,Date,Date);
          QEmbarqueItensNota.Next;
        End;
        QEmbarque.Edit;
        QEmbarqueInd_Atualiza_Estoque.Value := 'SIM';
        QEmbarqueDt_Atualiza_Estoque.Value := date;
        QEmbarque.Post;
        DmOracle.DBCemapa.Commit;
        QEmbarqueItensNota.Close;
      Except
        DmOracle.DBCemapa.Rollback;
        QEmbarqueItensNota.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Embarque não confirmado, notas fiscais não emitidas estoque não pode ser atualizado');
  End;
end;

procedure TFBaixaEstoquePeloEmbarque.Me7EmbarqueChange(Sender: TObject);
begin
  Me7EmbarqueExit(self);
end;

end.
