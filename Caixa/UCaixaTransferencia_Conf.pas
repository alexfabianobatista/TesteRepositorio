unit UCaixaTransferencia_Conf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db;

type
  TFCaixaTransferencia_Conf = class(TForm)
    Label1: TLabel;
    DSCaixaTransfSoma: TDataSource;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaTransferencia_Conf: TFCaixaTransferencia_Conf;

implementation

uses UCaixa_Transf_cl, UOracle_cl, UCaixa_cl, UUsuario_cl, UPlanilha_cl;

{$R *.DFM}

procedure TFCaixaTransferencia_Conf.BitBtn1Click(Sender: TObject);
Var wContaCred,wContaDeb,wHistContabil:String;
begin
  DMOracle.DBCemapa.StartTransaction;
  Try
    With DMCaixa_Transf Do
    Begin
      QCaixaTransfCab.Edit;
      DMCaixa.IncluiCaixa(QCaixaTransfCabCOD_FILIAL_REMETENTE.Value,
                          DMUsuario.CodDepartamentoUsuario,
                          QCaixaTransfCabCOD_HISTORICO_SAIDA.Value,
                          QCaixaTransfSomaSVAL_TOTAL.Value,
                          QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Value,
                          0,
                          'Transferencia',
                          QCaixaTransfCabDT_LANCAMENTO.Value,'','','','');
      QCaixaTransfCabCod_Caixa_Mov_Remete.Value := DMCaixa.QCaixa_MovCod_Caixa_Mov.Value;

      DMCaixa.IncluiCaixa(QCaixaTransfCabCOD_FILIAL_RECEBE.Value,
                          DMUsuario.CodDepartamentoUsuario,
                          QCaixaTransfCabCOD_HISTORICO_ENTRADA.Value,
                          QCaixaTransfSomaSVAL_TOTAL.Value,
                          QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Value,
                          0,
                          'Transferencia',
                          QCaixaTransfCabDT_LANCAMENTO.Value,'','','','');
      QCaixaTransfCabCod_Caixa_Mov_Recebe.Value := DMCaixa.QCaixa_MovCod_Caixa_Mov.Value;

      // AQUI VAI CONTABILIZAR A SAIDA DE DINHEIRO DE UMA FILIAL
      wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_SAIDA.Value));
      wContaDeb:=DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_SAIDA.Value));
      wHistContabil:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_SAIDA.Value));
      DMPlanilha.GravaLanc('TRANSF_CX',
                           QCaixaTransfCabCOD_CAIXA_TRANSF_CAB.Value,
                           QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Text,
                           QCaixaTransfCabCOD_FILIAL_REMETENTE.Value,
                           wContaCred,
                           'CREDITO',
                           0,
                           StrToFloat(wHistContabil),
                           QCaixaTransfSomaSVAL_TOTAL.Value,
                           QCaixaTransfCabDT_LANCAMENTO.Value,
                           wContaDeb);

      DMPlanilha.GravaLanc('TRANSF_CX',
                           QCaixaTransfCabCOD_CAIXA_TRANSF_CAB.Value,
                           QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Text,
                           QCaixaTransfCabCOD_FILIAL_REMETENTE.Value,
                           wContaDeb,
                           'DEBITO',
                           0,
                           StrToFloat(wHistContabil),
                           QCaixaTransfSomaSVAL_TOTAL.Value,
                           QCaixaTransfCabDT_LANCAMENTO.Value,
                           wContaCred);

      // AQUI VAI CONTABILIZAR A ENTRADA DE DINHEIRO DE UMA FILIAL
      wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_ENTRADA.Value));
      wContaDeb:=DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_ENTRADA.Value));
      wHistContabil:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixaTransfCabCOD_HISTORICO_ENTRADA.Value));
      DMPlanilha.GravaLanc('TRANSF_CX',
                           QCaixaTransfCabCOD_CAIXA_TRANSF_CAB.Value,
                           QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Text,
                           QCaixaTransfCabCOD_FILIAL_RECEBE.Value,
                           wContaCred,
                           'CREDITO',
                           0,
                           StrToFloat(wHistContabil),
                           QCaixaTransfSomaSVAL_TOTAL.Value,
                           QCaixaTransfCabDT_LANCAMENTO.Value,
                           wContaDeb);

      DMPlanilha.GravaLanc('TRANSF_CX',
                           QCaixaTransfCabCOD_CAIXA_TRANSF_CAB.Value,
                           QCaixaTransfCabNUM_LOTE_TRANSFERENCIA.Text,
                           QCaixaTransfCabCOD_FILIAL_RECEBE.Value,
                           wContaDeb,
                           'DEBITO',
                           0,
                           StrToFloat(wHistContabil),
                           QCaixaTransfSomaSVAL_TOTAL.Value,
                           QCaixaTransfCabDT_LANCAMENTO.Value,
                           wContaCred);
      QCaixaTransfCabInd_Situacao.Value := '2';                     
      QCaixaTransfCab.Post;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Confirmação Gerada Com Sucesso!');
    End;
  Except
    DMCaixa_Transf.QCaixaTransfCab.Cancel;
    DMOracle.DBCemapa.RollBack;
    Raise;
  End;
end;

end.
