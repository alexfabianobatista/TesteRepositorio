unit UConfirmaOrdemProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFConfirmaOrdemProducao = class(TForm)
    BtSim: TBitBtn;
    BtNao: TBitBtn;
    RGTipoOrdem: TRadioGroup;
    procedure BtSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfirmaOrdemProducao: TFConfirmaOrdemProducao;

implementation

uses UOracle_cl, UOrdemProducao_cl, UUsuario_cl, UOrdemProducaoCad,
  UTipoLoteCons, UTipoLote_cl, UFormulaParam, UParamSistema_cl;

{$R *.DFM}

procedure TFConfirmaOrdemProducao.BtSimClick(Sender: TObject);
begin
  if RgTipoOrdem.ItemIndex = 0 then
  Begin  //aqui começa ordem para produçao
    Try
      DMoracle.DBCemapa.StartTransaction;
      with DMOrdemProducao do
      Begin
        QOrdemProducao_cab.Close;
        QOrdemProducao_item.Close;
        QOrdemProducao_cab.open;
        QOrdemProducao_item.Open;
        QOrdemProducao_cab.insert;
        QOrdemProducao_cabDT_PRODUCAO.Value := DMoracle.DataServ;
        QOrdemProducao_cabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QOrdemProducao_cabIND_SITUACAO.Value := '1';
        QOrdemProducao_CabDESC_TIPO_ORDEM.Value := 'PRODUCAO';
        QordemProducao_cab.Post;
        DMOracle.DBCemapa.Commit;

        QREstoque_Producao.first;
        While not QREstoque_Producao.Eof do
        Begin
          If ((QREstoque_producaoqt_ordem.Value <> 0)) then
          Begin
            QordemProducao_item.Insert;
            QOrdemProducao_ItemCOD_ORDEM_PRODUCAO_CAB.Value := QOrdemProducao_cabCOD_ORDEM_PRODUCAO_CAB.Value;
            QOrdemProducao_ItemCOD_PRODUTO.Value := QREstoque_ProducaoCod_Componente.Value;
            If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
              QOrdemProducao_ItemCOD_LOTE.Value := 310
            else
              QOrdemProducao_ItemCOD_LOTE.Value := 1;
            QOrdemProducao_ItemQT_QUANTIDADE.Value := StrToInt(QREstoque_ProducaoQT_ORDEM.Text);
            QOrdemProducao_ItemQT_ORIGINAL.Value := StrToInt(QREstoque_ProducaoQT_ORDEM.Text);
            QOrdemProducao_ItemCOD_FORMULA.Value := QREstoque_ProducaoCOD_FORMULA.Value;
            QordemProducao_item.Post;
            DMOracle.DBCemapa.Commit;
          end;
          QREstoque_Producao.next;  
        end;
        QOrdemProducao_Cab.SetVariable('PK',QOrdemProducao_CabCod_Ordem_producao_cab.Value);
        QOrdemProducao_Item.Close;
        QOrdemProducao_Item.SetVariable('ORDEM_PRODUCAO_CAB',QOrdemProducao_CabCod_Ordem_producao_cab.Value);
        QOrdemProducao_Item.Open;
        If FordemProducaoCad = nil then
          FOrdemProducaoCad := TFOrdemProducaoCad.Create(Application);
          FOrdemProducaoCad.showmodal;
        end;
    except
      ShowMessage('Erro na Gravação da Produção');
      DMOracle.DBCemapa.Rollback;
    end;
    DMOrdemProducao.QOrdemProducao_item.close;
    DMOrdemProducao.QREstoque_Producao.close;
    DMOrdemProducao.QOrdemProducao_Item.close;
  end
  else
  Begin//aqui começa a ordem para pintura
    Try
      DMoracle.DBCemapa.StartTransaction;
      with DMOrdemProducao do
      Begin
        QOrdemProducao_cab.Close;
        QOrdemProducao_cab.open;
        QOrdemProducao_cab.insert;
        QOrdemProducao_cabDT_PRODUCAO.Value := DMoracle.DataServ;
        QOrdemProducao_cabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QOrdemProducao_cabIND_SITUACAO.Value := '1';
        QOrdemProducao_CabDESC_TIPO_ORDEM.Value := 'PINTURA';
        QOrdemProducao_CabDT_PERIODO_I.Text := FFormulaParam.ME3DtInicial.Text;
        QOrdemProducao_CabDT_PERIODO_F.Text := FFormulaParam.ME3DtFinal.Text;
        QordemProducao_cab.Post;
        DMOracle.DBCemapa.Commit;

        QRFormula_Pedido.first;
        QOrdemProducao_item.Open;
        While not QRFormula_Pedido.Eof do
        If (QRFormula_Pedidoqt_ordem.Value <> 0) then
        Begin
          QordemProducao_item.Insert;
          QOrdemProducao_ItemCOD_ORDEM_PRODUCAO_CAB.Value := QOrdemProducao_cabCOD_ORDEM_PRODUCAO_CAB.Value;
          QOrdemProducao_ItemCOD_PRODUTO.Value := StrToInt(QRFormula_PedidoCOD_PRODUTO.Text);
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
            QOrdemProducao_ItemCOD_LOTE.Value := 18
          else
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUNASA' Then
            QOrdemProducao_ItemCOD_LOTE.Value := 10;
          QOrdemProducao_ItemQT_QUANTIDADE.Value := StrToInt(QRFormula_PedidoQT_ORDEM.Text);
          QOrdemProducao_ItemQT_ORIGINAL.Value := StrToInt(QRFormula_PedidoQT_ORDEM.Text);
          QordemProducao_item.Post;
          DMOracle.DBCemapa.Commit;
          QRFormula_Pedido.next;
        end
        else
          QRFormula_Pedido.next;
      QOrdemProducao_Cab.SetVariable('PK',QOrdemProducao_CabCod_Ordem_producao_cab.Value);
      QOrdemProducao_Item.Close;
      QOrdemProducao_Item.SetVariable('ORDEM_PRODUCAO_CAB',QOrdemProducao_CabCod_Ordem_producao_cab.Value);
      QOrdemProducao_Item.Open;
      if FOrdemProducaoCad = Nil then
        FOrdemProducaoCad := TFOrdemProducaoCad.Create(Application);
      FOrdemProducaoCad.showmodal;
      end;
    except
      ShowMessage('Erro na Gravação da Produção');
      DMOracle.DBCemapa.Rollback;
    end;
    DMOrdemProducao.QOrdemProducao_item.close;
    DMOrdemProducao.QRFormula_Pedido.close;
    DMOrdemProducao.QOrdemProducao_Item.close;
  end;
end;

end.
