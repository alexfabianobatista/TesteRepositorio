unit UMenuCustos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, DB, variants;

type
  TFMenuCustos = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Cadastrodecustos1: TMenuItem;
    RateiodosCustos1: TMenuItem;
    N1: TMenuItem;
    EfetuarCalculoprateio1: TMenuItem;
    CadastroGrupodeCustos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cadastrodecustos1Click(Sender: TObject);
    procedure RateiodosCustos1Click(Sender: TObject);
    procedure EfetuarCalculoprateio1Click(Sender: TObject);
    procedure CadastroGrupodeCustos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCustos: TFMenuCustos;

implementation

uses UFCustosCad, UTela_cl, UFCustoCalculoRateio,
  UDMCustos, UOracle_cl, UFRateioCustoCad, UFGrupo_CustosCad, UUsuario_cl;

{$R *.DFM}

procedure TFMenuCustos.FormCreate(Sender: TObject);
begin
  inherited;
  pMODULO := 'CUSTOS';
end;

procedure TFMenuCustos.Cadastrodecustos1Click(Sender: TObject);
begin
  inherited;
  if FCustoCad = nil then
     FCustoCad := TFCustoCad.Create(Application);

  DMTela.VerificaTela(pModulo,FCustoCad.Caption,FCustoCad.Name);
  FCustoCad.ShowModal;
end;

procedure TFMenuCustos.RateiodosCustos1Click(Sender: TObject);
begin
  inherited;
  if FRateioCustoCad = nil then
     FRateioCustoCad := TFRateioCustoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRateioCustoCad.Caption,FRateioCustoCad.Name);
  FRateioCustoCad.ShowModal;
end;

procedure TFMenuCustos.EfetuarCalculoprateio1Click(Sender: TObject);
var mAtualiza : Integer;
begin
  inherited;
  if FCustosCalculo = nil then
     FCustosCalculo := TFCustosCalculo.Create(Application);

  if FCustosCalculo.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FCustosCalculo.EdCodFilial.Text),'CUSTOS');
    if (FCustosCalculo.ME_DataI.Text = '') OR (FCustosCalculo.ME_DataF.Text = '') then
        raise exception.Create('Data inicio e final não podem ficar em branco!');

    mAtualiza := 0;  // Inicializa valor da variavel

    // INICIA PROCESSO PARA CALCULO RATEIO CUSTOS.
    with DMCustos do
    begin
      QCustoCad.CommitOnPost := False;
      QRateioCalculoCustos.Close;
      if Trim(FCustosCalculo.EdCodFilial.Text) <> '' then
         QRateioCalculoCustos.SetVariable('COD_FILIAL',FCustosCalculo.EdCodFilial.Text)
      else
         QRateioCalculoCustos.SetVariable('COD_FILIAL',Null);

      QRateioCalculoCustos.SetVariable('DATA_I',FCustosCalculo.ME_DataI.Text);
      QRateioCalculoCustos.SetVariable('DATA_F',FCustosCalculo.ME_DataF.Text);
      QRateioCalculoCustos.Open;
      if QRateioCalculoCustos.RecordCount > 0 then     // Entrou ha movimento p/ rateio.
      begin
        QCustoCons.Close;
        if Trim(FCustosCalculo.EdCodFilial.Text) = '' then
           QCustoCons.SetVariable('COD_FILIAL',Null)
        else
           QCustoCons.SetVariable('COD_FILIAL',FCustosCalculo.EdCodFilial.Text);

        QCustoCons.SetVariable('COD_DEPARTAMENTO',Null);
        QCustoCons.SetVariable('COD_PLANO_CONTA',Null);
        QCustoCons.SetVariable('DATA_I',FCustosCalculo.ME_DataI.Text);
        QCustoCons.SetVariable('DATA_F',FCustosCalculo.ME_DataF.Text);
        QCustoCons.Open;

        Try
          If DMOracle.DBCemapa.InTransaction = False then
             DMOracle.DBCemapa.StartTransaction;

          While not QRateioCalculoCustos.Eof do
          begin
            QRateio_CustosCons.Close;
            QRateio_CustosCons.SetVariable('COD_FILIAL_ORIG',QRateioCalculoCustosCod_Filial.Value);
            QRateio_CustosCons.SetVariable('COD_DPTO_ORIG',QRateioCalculoCustosCod_Departamento.Value);
            QRateio_CustosCons.SetVariable('COD_PLANO_CONTA',QRateioCalculoCustosCod_Plano_Conta.Value);
            QRateio_CustosCons.Open;
            If Not QRateio_CustosCons.Eof Then
             Begin
              While not QRateio_CustosCons.Eof do
               Begin
                 If not QCustoCons.Locate('COD_FILIAL;COD_DEPARTAMENTO;COD_PLANO_CONTA;DT_LANCAMENTO',
                                   VarArrayOf([QRateio_CustosConsCOD_FILIAL_DEST.Value,QRateio_CustosConsCOD_DPTO_DEST.Value,
                                               QRateioCalculoCustosCOD_PLANO_CONTA.Value,QRateioCalculoCustosDT_LANCAMENTO.Value]), [loPartialKey]) then
                 begin
                   QCustoCad.Close;
                   QCustoCad.Open;
                   QCustoCad.Insert;
                   QCustoCadCOD_CUSTO.Value       := DMOracle.Sequencia('CUSTOS');
                   QCustoCadCOD_FILIAL.Value      := QRateio_CustosConsCOD_FILIAL_DEST.Value;
                   QCustoCadCOD_PLANO_CONTA.Value := StrToInt(QRateioCalculoCustosCOD_PLANO_CONTA.Text);
                   QCustoCadCOD_DEPARTAMENTO.Value:= QRateio_CustosConsCOD_DPTO_DEST.Value;
                   QCustoCadDT_LANCAMENTO.Value   := QRateioCalculoCustosDT_LANCAMENTO.Value;
                   QCustoCadVAL_CUSTO.Value       := ((QRateioCalculoCustosVAL_LANCAMENTO.Value *
                                                     QRateio_CustosConsPERC_RATEIO.Value)/100);
                   QCustoCadDESC_OBSERVACAO.Value :=
                   'FILIAL:'+Trim(QRateioCalculoCustosCOD_FILIAL.Text)+
                   ' DEPTO.:'+Trim(QRateioCalculoCustosCOD_DEPARTAMENTO.Text)+
                   ' HIST.:'+Trim(QRateioCalculoCustosCOD_PLANO_CONTA.Text)+
                   ' DATA:'+Trim(QRateioCalculoCustosDT_LANCAMENTO.Text)+
                   ' TOTAL:'+Trim(QRateioCalculoCustosVAL_LANCAMENTO.Text);
                   QCustoCad.Post;
                   mAtualiza := mAtualiza + 1;
                 end;
                 QRateio_CustosCons.Next;
               end;
             End
            Else
             Begin
               If not QCustoCons.Locate('COD_FILIAL;COD_DEPARTAMENTO;COD_PLANO_CONTA;DT_LANCAMENTO',
                                 VarArrayOf([QRateioCalculoCustosCOD_FILIAL.Value,QRateioCalculoCustosCOD_DEPARTAMENTO.Value,
                                             QRateioCalculoCustosCOD_PLANO_CONTA.Value,QRateioCalculoCustosDT_LANCAMENTO.Value]), [loPartialKey]) then
               begin
                 QCustoCad.Close;
                 QCustoCad.Open;
                 QCustoCad.Insert;
                 QCustoCadCOD_CUSTO.Value       := DMOracle.Sequencia('CUSTOS');
                 QCustoCadCOD_FILIAL.Value      := StrToInt(QRateioCalculoCustosCOD_FILIAL.Text);
                 QCustoCadCOD_PLANO_CONTA.Value := StrToInt(QRateioCalculoCustosCOD_PLANO_CONTA.Text);
                 If QRateioCalculoCustosCOD_DEPARTAMENTO.Text <> '' Then
                    QCustoCadCOD_DEPARTAMENTO.Value:= StrToInt(QRateioCalculoCustosCOD_DEPARTAMENTO.Text)
                 else
                    QCustoCadCOD_DEPARTAMENTO.Value:= 1;
                 QCustoCadDT_LANCAMENTO.Value   := QRateioCalculoCustosDT_LANCAMENTO.Value;
                 QCustoCadVAL_CUSTO.Value       := QRateioCalculoCustosVAL_LANCAMENTO.Value;
                 QCustoCadDESC_OBSERVACAO.Value :=
                 'FILIAL:'+Trim(QRateioCalculoCustosCOD_FILIAL.Text)+
                 ' DEPTO.:'+Trim(QRateioCalculoCustosCOD_DEPARTAMENTO.Text)+
                 ' HIST.:'+Trim(QRateioCalculoCustosCOD_PLANO_CONTA.Text)+
                 ' DATA:'+Trim(QRateioCalculoCustosDT_LANCAMENTO.Text)+
                 ' TOTAL:'+Trim(QRateioCalculoCustosVAL_LANCAMENTO.Text);
                 QCustoCad.Post;
                 mAtualiza := mAtualiza + 1;
               end;
             End;
            QRateioCalculoCustos.Next;
          End;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Erro na tentativa de concluir Transação com Banco de Dados!');
        end;
        QRateioCalculoCustos.Close;
        QCustoCad.Close;
        QRateio_CustosCons.Close;
        if mAtualiza <> 0 then
           MessageDlg(IntToStr(mAtualiza)+' rateios efetuados com sucesso!',mtInformation,[mbOk],0)
        else
           MessageDlg('Já foi feito rateio para periodo informado!',mtInformation,[mbOk],0);
      end
      else
         MessageDlg('Não há movimento no periodo informado para fazer rateio!',mtInformation,[mbOk],0);

    end;

  end
  else
     MessageDlg('Não foi efetuado calculo, operação cancelada!',mtInformation,[mbOk],0);
end;

procedure TFMenuCustos.CadastroGrupodeCustos1Click(Sender: TObject);
begin
  inherited;
  If FGrupo_CustosCad=Nil then
    FGrupo_CustosCad:=TFGrupo_CustosCad.Create(Application);
  DMTela.VerificaTela(pModulo,FGrupo_CustosCad.Caption,FGrupo_CustosCad.Name);
  FGrupo_CustosCad.ShowModal;
  FGrupo_CustosCad.Release;
  FGrupo_CustosCad:=Nil;

end;

end.
