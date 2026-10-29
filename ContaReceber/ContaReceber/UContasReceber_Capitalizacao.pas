unit UContasReceber_Capitalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, Variants;

type
  TFContasReceber_Capitalizacao = class(TForm)
    Panel1: TPanel;
    MEData: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Pb: TProgressBar;
    Label193: TLabel;
    SpeedButton66: TSpeedButton;
    MeCodCliente: TMaskEdit;
    EdCliente: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure MeCodClienteExit(Sender: TObject);
    procedure MeCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceber_Capitalizacao: TFContasReceber_Capitalizacao;

implementation

uses UOracle_cl, UContasReceber_cl, UCaixa_cl, UPlanilha_cl, UUsuario_cl,
  UCadastroCons, UCadastro_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFContasReceber_Capitalizacao.BitBtn1Click(Sender: TObject);
Var  wValor_Juro,wPerc_Juro_Mora:real;
     wDataCapitalizacao:String;
     wCont : Integer;
begin
  Try
    DMOracle.DBCemapa.StartTransaction;
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
       (Trim(MeCodCliente.Text) = '') Then
       Raise Exception.Create('Preencher Código Cadastro');
    with DMContasReceber do
      begin
        QCapitalizacao.Close;
        QCapitalizacao.SetVariable('DT_CAPITALIZACAO',StrToDate(MEData.Text));
        If Trim(MeCodCliente.Text) <> '' Then
           QCapitalizacao.SetVariable('COD_CADASTRO',StrToInt(Trim(MeCodCliente.Text)))
        Else
           QCapitalizacao.SetVariable('COD_CADASTRO',Null);
        QCapitalizacao.Open;
        Pb.Max := QCapitalizacao.RecordCount;
        QCapitalizacao.First;
        While Not(DMContasReceber.QCapitalizacao.Eof) do
          begin
            If QCapitalizacaoind_tipo_juro.value<>'SEM JURO' then
              Begin
                wPerc_Juro_Mora := 0;
                if (QCapitalizacaoPerc_Juro_Mora.Text <> '') And (QCapitalizacaoInd_Situacao.Value = 'ABERTO' )Then
                   wPerc_Juro_Mora  := QCapitalizacaoPerc_Juro_Mora.value;
                wDataCapitalizacao:=DateToStr(DMContasReceber.QCapitalizacaoDt_Capitalizacao.Value);
                wValor_Juro:=CalculaJuros(QCapitalizacaoVal_Titulo.Value+QCapitalizacaoVal_Juros.Value,QCapitalizacaotaxa_juro.Value,wPerc_Juro_Mora,QCapitalizacaocod_moeda.Value,
                             StrToDate(wDataCapitalizacao),StrToDate(MEData.Text),QCapitalizacaoDt_Capitalizacao_Moeda.Value,QCapitalizacaoind_tipo_juro.Value,'0','CR');
                if wValor_Juro>0.009 then
                  begin
                    QCapitalizacao.Edit;
                    QCapitalizacaoVal_Titulo.Value:=QCapitalizacaoVal_Titulo.Value;
                    QCapitalizacaoDt_Capitalizacao.Value:=StrToDate(MEData.Text);
                    QCapitalizacaoVal_Juros.Value:=QCapitalizacaoVal_Juros.Value+wValor_Juro;
                    QCapitalizacao.Post;
                    QCapitalizacaoMov.Open;

                    //Inclui no Movimento o Juro
                    QCapitalizacaoMov.Insert;
                    QCapitalizacaoMovVal_Movimento.Value:=wValor_Juro;
                    QCapitalizacaoMovDt_Movimento.Value:=StrToDate(MEData.Text);
                    QCapitalizacaoMovInd_Tipo_Movimento.Value:='JUROS';
                    QCapitalizacaoMov.Post;
                    QCapitalizacaoMov.Close;
                  end;
              End;
            QCapitalizacao.Next;
            wCont := wCont + 1;
            Pb.stepIt;
          End; // while
      end;
      DMOracle.DBCemapa.Commit;
      Pb.Position := 0;
    except
      DMOracle.DBCemapa.RollBack;
      raise exception.create('Erro! Transação não efetuada');
    end;
    ShowMessage('Operação Efetuada com Sucesso.');

end;

procedure TFContasReceber_Capitalizacao.SpeedButton66Click(
  Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MeCodCliente.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MeCodClienteexit(sender);
  End;

end;

procedure TFContasReceber_Capitalizacao.MeCodClienteExit(Sender: TObject);
begin
  if Trim(MeCodCliente.Text) <> '' then
    EdCliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + MeCodCliente.Text)
  else
    EdCliente.Text := 'Todos';

end;

procedure TFContasReceber_Capitalizacao.MeCodClienteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     If Key = 123 Then //123 = F12
        SpeedButton66.Click;
end;

end.
