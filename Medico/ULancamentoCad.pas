unit ULancamentoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu;

type
  TFLancamentoCad = class(TFTCadSimples)
    Bevel1: TBevel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBRGTipoPgto: TDBRadioGroup;
    SbBuscaMedico: TSpeedButton;
    SbBuscaConvenio: TSpeedButton;
    DBDirceuMedico: TDBDirceu;
    DBDirceuConvenio: TDBDirceu;
    Lanamentos1: TMenuItem;
    EmissodeRecibo1: TMenuItem;
    LanamentosSinttico1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBRGTipoPgtoChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SbBuscaMedicoClick(Sender: TObject);
    procedure SbBuscaConvenioClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure EmissodeRecibo1Click(Sender: TObject);
    procedure LanamentosSinttico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancamentoCad: TFLancamentoCad;

implementation

uses ULancamento_cl, UMedicoCons, UConvenioCons, UMedico_cl, UConvenio_cl,
  ULancamentoCons, ULancamentoParam, URLancamento, UFilial_cl,
  UParamSistema_cl, URReciboMedico, UBiblioteca, URLancamentoSintetico,
  USequencia_cl;

{$R *.dfm}

procedure TFLancamentoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMLancamento.QLancamento;
end;

procedure TFLancamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFLancamentoCad.DBRGTipoPgtoChange(Sender: TObject);
var
  wAux : boolean; //Variável Auxiliar para Controle de Visibilidade dos Campos que pertence ao Convênio
begin
  inherited;
  wAux := true;   //Inicializa Variável

  if DBRGTipoPgto.ItemIndex = 0 then //Opção Convênio
    wAux := true;                    //---Habilita o Campo Convênio
  if DBRGTipoPgto.ItemIndex = 1 then //Opção Particular
    wAux := false;                   //---Desabilita o Campo Convênio

  //Campos ligados há Convênio
  //---------------------------
  Label3.Visible            := wAux;
  DBEdit3.Visible           := wAux;
  DBEdit3.Text              := '';
  SbBuscaConvenio.Visible   := wAux;
  DBDirceuConvenio.Visible  := wAux;
  DBDirceuConvenio.KeyValueChanged();
  //---------------------------
end;

procedure TFLancamentoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  //Fixar um Tipo de Pagamento ao Lançamento
  DBRGTipoPgto.ItemIndex := 1;
  //----------------------------------------
end;

procedure TFLancamentoCad.SBConfirmarClick(Sender: TObject);
begin
  if (DBRGTipoPgto.ItemIndex = 0) and (DBEdit3.Text = '') then //Opção Convênio Marcada e Campo Convênio Limpo
    Raise Exception.Create('É Necessário Informar um Convênio ao Lançamento Corrente.');
  inherited;
end;

procedure TFLancamentoCad.SbBuscaMedicoClick(Sender: TObject);
begin
  inherited;
  if FMedicoCons = Nil then
    FMedicoCons := TFMedicoCons.Create(Application);
  if FMedicoCons.ShowModal = MrOk then
    DMLancamento.QLancamentoCOD_MEDICO.Text := DMMedico.QMedicoConsCOD_MEDICO.Text;
end;

procedure TFLancamentoCad.SbBuscaConvenioClick(Sender: TObject);
begin
  inherited;
  if FConvenioCons = Nil then
    FConvenioCons := TFConvenioCons.Create(Application);
  if FConvenioCons.ShowModal = MrOk then
    DMLancamento.QLancamentoCOD_CONVENIO.Text := DMConvenio.QConvenioConsCOD_CONVENIO.Text;
end;

procedure TFLancamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLancamentoCons = Nil then
    FLancamentoCons := TFLancamentoCons.Create(Application);
  if FLancamentoCons.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMLancamento.QLancamentoConsCOD_LANCAMENTO.Text;
    MELocalizaExit(self);
  end;
end;

procedure TFLancamentoCad.Lanamentos1Click(Sender: TObject);
begin
  inherited;
  if FLancamentoParam = Nil then
    FLancamentoParam := TFLancamentoParam.Create(Application);
  FLancamentoParam.PGRelatorio.Pages[0].TabVisible := true;
  if FLancamentoParam.ShowModal = MrOk then
  begin
    //Passagem de Parâmetros para Relatório.
    with DMLancamento do
    begin
      QRLancamento.Close;

      if Trim(FLancamentoParam.FmMedico1.MeMedico.Text) <> '' then
        QRLancamento.SetVariable('MEDICO', Trim(FLancamentoParam.FmMedico1.MeMedico.Text))
      else
        QRLancamento.SetVariable('MEDICO', null);

      if Trim(FLancamentoParam.FmConvenio1.MeConvenio.Text) <> '' then
        QRLancamento.SetVariable('CONVENIO', Trim(FLancamentoParam.FmConvenio1.MeConvenio.Text))
      else
        QRLancamento.SetVariable('CONVENIO', null);

      if (Trim(FLancamentoParam.FmDatasLancamento1.MeDtInicial.Text) = '') or (Trim(FLancamentoParam.FmDatasLancamento1.MeDtInicial.Text) = '') then
      begin
        QRLancamento.SetVariable('DT_LANC_I', NULL);
        QRLancamento.SetVariable('DT_LANC_F', NULL);
      end
      else
      begin
        QRLancamento.SetVariable('DT_LANC_I', Trim(FLancamentoParam.FmDatasLancamento1.MeDtInicial.Text));
        QRLancamento.SetVariable('DT_LANC_F', Trim(FLancamentoParam.FmDatasLancamento1.MeDtFinal.Text));
      end;

      if (Trim(FLancamentoParam.FmDatasPagamento1.MeDtInicial.Text) = '') or (Trim(FLancamentoParam.FmDatasPagamento1.MeDtInicial.Text) = '') then
      begin
        QRLancamento.SetVariable('DT_PGTO_I', NULL);
        QRLancamento.SetVariable('DT_PGTO_F', NULL);
      end
      else
      begin
        QRLancamento.SetVariable('DT_PGTO_I', Trim(FLancamentoParam.FmDatasPagamento1.MeDtInicial.Text));
        QRLancamento.SetVariable('DT_PGTO_F', Trim(FLancamentoParam.FmDatasPagamento1.MeDtFinal.Text));
      end;

      Case FLancamentoParam.RgTipoPagamento1.ItemIndex of
        0 : QRLancamento.SetVariable('TIPO_PAGAMENTO','C');
        1 : QRLancamento.SetVariable('TIPO_PAGAMENTO','P');
        2 : QRLancamento.SetVariable('TIPO_PAGAMENTO', null);
      End;
      Case FLancamentoParam.RgSituacao1.ItemIndex of
        0 : QRLancamento.SetVariable('SITUACAO','N');
        1 : QRLancamento.SetVariable('SITUACAO','P');
        2 : QRLancamento.SetVariable('SITUACAO', null);
      End;
    end;

    if FRLancamento = Nil then
      FRLancamento := TFRLancamento.Create(Application);

    //cabeçalho
    //----------------------------------
    FRLancamento.QRLData_I.Caption := Trim(FLancamentoParam.FmDatasLancamento1.MeDtInicial.Text);
    FRLancamento.QRLData_F.Caption := Trim(FLancamentoParam.FmDatasLancamento1.MeDtFinal.Text);
    //----------------------------------

    //Quebra e Ordenação
    //----------------------------------
    Case FLancamentoParam.RgQuebra1.ItemIndex of
      0 :
        begin
          DMLancamento.QRLancamento.SetVariable('ORDENACAO','TB_LANCAMENTO."DT_LANCAMENTO"');
          FRLancamento.QRGroupMes.Expression  := 'QRLancamento.MES_ANO_LANCAMENTO';
          FRLancamento.QRDBQuebra.DataField   := 'MES_ANO_LANCAMENTO';
          FRLancamento.QRLTitulo.Caption      := 'Relatório de Lançamentos - por Dt. Lançamento.';
        end;
      1 :
        begin
          DMLancamento.QRLancamento.SetVariable('ORDENACAO','TB_LANCAMENTO."DT_PAGAMENTO"');
          FRLancamento.QRGroupMes.Expression := 'QRLancamento.MES_ANO_PAGAMENTO';
          FRLancamento.QRDBQuebra.DataField  := 'MES_ANO_PAGAMENTO';
          FRLancamento.QRLTitulo.Caption     := 'Relatório de Lançamentos - por Dt. Pagamento.';
        end;
    End;
    //----------------------------------
    DMLancamento.QRLancamento.Open;

    if FLancamentoParam.RGPreview.ItemIndex = 0 then
      FRLancamento.QRPrimario.Preview
    else
      FRLancamento.QRPrimario.Print;

    DMLancamento.QRLancamento.Close;
    //-------------------------------------------------
  end;
end;

procedure TFLancamentoCad.EmissodeRecibo1Click(Sender: TObject);
var
  wTotal: Real;
begin
  inherited;
  if FLancamentoParam = Nil then
    FLancamentoParam := TFLancamentoParam.Create(Application);
  FLancamentoParam.PGRelatorio.Pages[1].TabVisible := true;
  if FLancamentoParam.ShowModal = MrOk then
  begin
    //Passagem de Parâmetros para Relatório.
    //---------------------------------------------------
    with DMLancamento do
    begin
      QRReciboLancamento.Close;

      if Trim(FLancamentoParam.FmMedico2.MeMedico.Text) <> '' then
        QRReciboLancamento.SetVariable('MEDICO', Trim(FLancamentoParam.FmMedico2.MeMedico.Text))
      else
        Raise Exception.Create('É necessário informar um Médico para emitir o Recibo.');

      if (FLancamentoParam.RgTipoPagamento2.ItemIndex = 0) then
      begin
        if (Trim(FLancamentoParam.FmConvenio2.MeConvenio.Text) <> '') then
          QRReciboLancamento.SetVariable('CONVENIO', Trim(FLancamentoParam.FmConvenio2.MeConvenio.Text))
        else
          QRReciboLancamento.SetVariable('CONVENIO', null);
        QRReciboLancamento.SetVariable('TIPO_PAGAMENTO', 'C');
      end
      else
      begin
        QRReciboLancamento.SetVariable('CONVENIO', null);
        QRReciboLancamento.SetVariable('TIPO_PAGAMENTO', 'P');

        if FLancamentoParam.RgTipoPagamento2.ItemIndex = 2 then
          QRReciboLancamento.SetVariable('TIPO_PAGAMENTO', null);
      end;

      if (Trim(FLancamentoParam.FmDatasPagamento2.MeDtInicial.Text) = '') or (Trim(FLancamentoParam.FmDatasPagamento2.MeDtInicial.Text) = '') then
        Raise Exception.Create('Deve-se informar um Intervalo de Datas de Pagamento válido.')
      else
      begin
        QRReciboLancamento.SetVariable('DT_PGTO_I', Trim(FLancamentoParam.FmDatasPagamento2.MeDtInicial.Text));
        QRReciboLancamento.SetVariable('DT_PGTO_F', Trim(FLancamentoParam.FmDatasPagamento2.MeDtFinal.Text));
      end;

      QRReciboLancamento.Open;
    end;

    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMParamSistema.QParamSistemaCOD_FILIAL.Text);
      QFilial.Open;
    end;

    if FRReciboMedico = Nil then
      FRReciboMedico := TFRReciboMedico.Create(Application);

    wTotal := 0;
    DMLancamento.QRReciboLancamento.First;
    while not DMLancamento.QRReciboLancamento.Eof do
    begin
      wTotal := wTotal + DMLancamento.QRReciboLancamentoVAL_PAGAMENTO.Value;
      DMLancamento.QRReciboLancamento.Next;
    end;
    //Informações Formatadas do Recibo
    //--------------------------------------------------------------------------
    FRReciboMedico.QRLValorExtenso.Caption := Bib.extenso(wTotal, 'REAL');
    FRReciboMedico.QRLData.Caption         := FormatDateTime('dd "de" mmmm "de" yyyy' + ', ', Date);
    //Numero do Recibo
    FRReciboMedico.QRLNumRecibo.Caption := IntToStr(DMSequencia.Sequencia(DMParamSistema.QParamSistemaCOD_FILIAL.Value, 'RECIBO'));
    //--------------------------------------------------------------------------

    if FLancamentoParam.RGPreview.ItemIndex = 0 then
      FRReciboMedico.QRPrimario.Preview
    else
      FRReciboMedico.QRPrimario.Print;

    DMLancamento.QRReciboLancamento.Close;
    //-------------------------------------------------
  end;
end;

procedure TFLancamentoCad.LanamentosSinttico1Click(Sender: TObject);
begin
  inherited;
  if FLancamentoParam = Nil then
    FLancamentoParam := TFLancamentoParam.Create(Application);
  FLancamentoParam.PGRelatorio.Pages[2].TabVisible := true;
  if FLancamentoParam.ShowModal = MrOk then
  begin
    //Passagem de Parâmetros para Relatório.
    //---------------------------------------------------
    with DMLancamento do
    begin
      QRLancamentoSintetico.Close;

      if (Trim(FLancamentoParam.FmDatasPagamento3.MeDtInicial.Text) = '') or (Trim(FLancamentoParam.FmDatasPagamento3.MeDtInicial.Text) = '') then
      begin
        QRLancamentoSintetico.SetVariable('DT_PGTO_I',NULL);
        QRLancamentoSintetico.SetVariable('DT_PGTO_F',NULL);
      end
      else
      begin
        QRLancamentoSintetico.SetVariable('DT_PGTO_I', Trim(FLancamentoParam.FmDatasPagamento3.MeDtInicial.Text));
        QRLancamentoSintetico.SetVariable('DT_PGTO_F', Trim(FLancamentoParam.FmDatasPagamento3.MeDtFinal.Text));
      end;

      if Trim(FLancamentoParam.FmMedico3.MeMedico.Text) <> '' then
        QRLancamentoSintetico.SetVariable('MEDICO', Trim(FLancamentoParam.FmMedico3.MeMedico.Text))
      else
        QRLancamentoSintetico.SetVariable('MEDICO', null);

      if Trim(FLancamentoParam.FmConvenio3.MeConvenio.Text) <> '' then
        QRLancamentoSintetico.SetVariable('CONVENIO', Trim(FLancamentoParam.FmConvenio3.MeConvenio.Text))
      else
        QRLancamentoSintetico.SetVariable('CONVENIO', null);

      If FRLancamentoSintetico = Nil Then
        FRLancamentoSintetico := TFRLancamentoSintetico.Create(Application);

      Case FLancamentoParam.RgTipoPagamento3.ItemIndex of
        0 : begin QRLancamentoSintetico.SetVariable('TIPO_PAGAMENTO','C');   FRLancamentoSintetico.QRLConvenio.Caption := Trim(FLancamentoParam.FmConvenio3.EdConvenio.Text); end;
        1 : begin QRLancamentoSintetico.SetVariable('TIPO_PAGAMENTO','P');   FRLancamentoSintetico.QRLConvenio.Caption := '';                                                 end;
        2 : begin QRLancamentoSintetico.SetVariable('TIPO_PAGAMENTO', null); FRLancamentoSintetico.QRLConvenio.Caption := '';                                                 end;
      End;

      QRLancamentoSintetico.Open;
    end;

    //cabeçalho
    //----------------------------------
    FRLancamentoSintetico.QRLData_I.Caption        := Trim(FLancamentoParam.FmDatasPagamento3.MeDtInicial.Text);
    FRLancamentoSintetico.QRLData_F.Caption        := Trim(FLancamentoParam.FmDatasPagamento3.MeDtFinal.Text);
    FRLancamentoSintetico.QRLTipoPagamento.Caption := Trim(FLancamentoParam.RgTipoPagamento3.Items.Strings[FLancamentoParam.RgTipoPagamento3.ItemIndex]);
    //----------------------------------

    if FLancamentoParam.RGPreview.ItemIndex = 0 then
      FRLancamentoSintetico.QRPrimario.Preview
    else
      FRLancamentoSintetico.QRPrimario.Print;

    DMLancamento.QRLancamentoSintetico.Close;
  //-------------------------------------------------
  end;
end;

end.
