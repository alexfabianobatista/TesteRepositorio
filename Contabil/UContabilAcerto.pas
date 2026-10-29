unit UContabilAcerto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, StdCtrls, Buttons;

type
  TFContabilAcerto = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QAcertoContrapartida: TOracleDataSet1;
    QAcertoContrapartidaCOD_LANCTO_CONTABIL: TIntegerField;
    QAcertoContrapartidaCOD_NOTA_CAB: TIntegerField;
    QAcertoContrapartidaCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QAcertoContrapartidaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QAcertoContrapartidaCOD_BCO_MOVIMENTO: TIntegerField;
    QAcertoContrapartidaCOD_CAIXA_MOV: TIntegerField;
    QAcertoContrapartidaCOD_FILIAL: TIntegerField;
    QAcertoContrapartidaCOD_HISTORICO_CONTABIL: TIntegerField;
    QAcertoContrapartidaCOD_PLANO_CONTA: TIntegerField;
    QAcertoContrapartidaDT_LANCAMENTO: TDateTimeField;
    QAcertoContrapartidaNUM_LANCAMENTO: TIntegerField;
    QAcertoContrapartidaDESC_COMPLEMENTO: TStringField;
    QAcertoContrapartidaVAL_LANCAMENTO: TFloatField;
    QAcertoContrapartidaIND_OPERACAO: TStringField;
    QAcertoContrapartidaCOD_PLANILHA: TIntegerField;
    QAcertoContrapartidaNUM_CONTRAPARTIDA: TStringField;
    QAcertoContrapartidaIND_ATUALIZA_SALDO: TStringField;
    QAcertoContrapartidaCOD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QAcertoContrapartidaCOD_GENERICO: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilAcerto: TFContabilAcerto;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TFContabilAcerto.BitBtn1Click(Sender: TObject);
Var wCadastro,wContrapartida : String;
begin
   QAcertoContrapartida.Close;
   QAcertoContrapartida.Open;
   While not QAcertoContrapartida.eof do
   Begin
     If QAcertoContrapartidaCod_Bco_Movimento.Text <> '' Then
      Begin
       wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QAcertoContrapartidaCod_Bco_Movimento.Text);
       If wCadastro <> '' Then
        Begin
          wContrapartida := QAcertoContrapartidaNum_Contrapartida.Text + FormatFloat('000000',StrToInt(wCadastro));
          QAcertoContrapartida.Edit;
          QAcertoContrapartidaNum_Contrapartida.Value := wContrapartida;
          QAcertoContrapartida.Post;
        End;
      End;
     If QAcertoContrapartidaCod_Caixa_Mov.Text <> '' Then
      Begin
       wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CAIXA_MOV','COD_CAIXA_MOV = '+QAcertoContrapartidaCod_Caixa_Mov.Text);
       If wCadastro <> '' Then
        Begin
          wContrapartida := QAcertoContrapartidaNum_Contrapartida.Text + FormatFloat('000000',StrToInt(wCadastro));
          QAcertoContrapartida.Edit;
          QAcertoContrapartidaNum_Contrapartida.Value := wContrapartida;
          QAcertoContrapartida.Post;
        End;
      End;
     If QAcertoContrapartidaCod_Conta_Pagar_Cab.Text <> '' Then
      Begin
       wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CONTA_PAGAR_CAB','COD_CONTA_PAGAR_CAB = '+QAcertoContrapartidaCod_Conta_Pagar_Cab.Text);
       If wCadastro <> '' Then
        Begin
          wContrapartida := QAcertoContrapartidaNum_Contrapartida.Text + FormatFloat('000000',StrToInt(wCadastro));
          QAcertoContrapartida.Edit;
          QAcertoContrapartidaNum_Contrapartida.Value := wContrapartida;
          QAcertoContrapartida.Post;
        End;
      End;
     If QAcertoContrapartidaCod_Contas_Receber_Cab.Text <> '' Then
      Begin
       wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CONTA_RECEBER_CAB','COD_CONTA_RECEBER_CAB = '+QAcertoContrapartidaCod_Contas_Receber_Cab.Text);
       If wCadastro <> '' Then
        Begin
          wContrapartida := QAcertoContrapartidaNum_Contrapartida.Text + FormatFloat('000000',StrToInt(wCadastro));
          QAcertoContrapartida.Edit;
          QAcertoContrapartidaNum_Contrapartida.Value := wContrapartida;
          QAcertoContrapartida.Post;
        End;
      End;
     If QAcertoContrapartidaCod_Nota_Cab.Text <> '' Then
      Begin
       wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB','COD_NOTA_CAB = '+QAcertoContrapartidaCod_Nota_Cab.Text);
       If wCadastro <> '' Then
        Begin
          wContrapartida := QAcertoContrapartidaNum_Contrapartida.Text + FormatFloat('000000',StrToInt(wCadastro));
          QAcertoContrapartida.Edit;
          QAcertoContrapartidaNum_Contrapartida.Value := wContrapartida;
          QAcertoContrapartida.Post;
        End;
      End;
     QAcertoContrapartida.Next;
   End;
end;

end.
