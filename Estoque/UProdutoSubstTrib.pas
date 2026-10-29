unit UProdutoSubstTrib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel, Oracle;

type
  TFProdutoSubstTrib = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SpeedButton2: TSpeedButton;
    EdEstado: TEdit;
    RelaodeProdutoscomSubstituioTributria1: TMenuItem;
    DBPanel3: TDBPanel;
    DBPanel1: TDBPanel;
    DBPTributacao: TDBPanel;
    DBPBaseCalculoST: TDBPanel;
    DBPBaseCalculoSTSN: TDBPanel;
    DBPAliquotaST: TDBPanel;
    Opes1: TMenuItem;
    AtualizarMVApeloNCM1: TMenuItem;
    ProdutoSTporNCM1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure RelaodeProdutoscomSubstituioTributria1Click(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPBaseCalculoSTValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure DBPTributacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure AtualizarMVApeloNCM1Click(Sender: TObject);
    procedure ProdutoSTporNCM1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSubstTrib: TFProdutoSubstTrib;

implementation

uses UTributacao_cl, UProdutoCons, UProduto_cl, UEstadoCons, UEstado_cl,
  UOracle_cl, UProdutoSubstTribCons, UTributacaoParam, URProdutoSubstTrib,
  UFilialCons, UTributacaoCons;

{$R *.dfm}

procedure TFProdutoSubstTrib.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    DMTributacao.QProdutoSubstTribCOD_PRODUTO.Text :=
      DMProduto.QProdutoConsCOD_PRODUTO.Text;
  end;
end;

procedure TFProdutoSubstTrib.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = MrOk then
  begin
    DMTributacao.QProdutoSubstTribCOD_ESTADO.Text :=
      DMEstado.QEstadoConsCOD_ESTADO.Text;
      DBEdit3Exit(Sender);
  end;             
end;

procedure TFProdutoSubstTrib.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMTributacao.QProdutoSubstTrib;
  DSPrimario.DataSet.Open();
end;

procedure TFProdutoSubstTrib.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert,dsEdit] then
  begin
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
  end
  else
  begin
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
  end;
end;

procedure TFProdutoSubstTrib.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DMTributacao.QProdutoSubstTribCOD_ESTADO.Value <> '' then
  begin
    EdEstado.Text :=
      DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = ' +
      chr(39) + trim(DMTributacao.QProdutoSubstTribCOD_ESTADO.Value) + chr(39));
  end
  else
    EdEstado.Text := '';
end;

procedure TFProdutoSubstTrib.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProdutoSubstTribCons = Nil then
    FProdutoSubstTribCons := TFProdutoSubstTribCons.Create(Application);
  if FProdutoSubstTribCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMTributacao.QProdutoSubstTribConsCOD_PRODUTO_SUBST_TRIB.Text;
    MeLocalizaExit(Sender);
  end;
end;

procedure TFProdutoSubstTrib.DBEdit3Change(Sender: TObject);
begin
  inherited;
  if length(trim(DBEdit3.Text)) >= 2 then
    DBEdit3Exit(Sender);
end;

procedure TFProdutoSubstTrib.RelaodeProdutoscomSubstituioTributria1Click(
  Sender: TObject);
begin
  inherited;
  if FTributacaoParam = Nil then
    FTributacaoParam := TFTributacaoParam.Create(Application);
  FTributacaoParam.PGRelatorio.Pages[1].TabVisible := true;
  if FTributacaoParam.ShowModal = MrOk then
  begin
    with DMTributacao do
    begin
      QRProdutoSubstTrib.Close();
      if trim(FTributacaoParam.fmProduto1.meProduto.Text) <> '' then
        QRProdutoSubstTrib.SetVariable('COD_PRODUTO',trim(FTributacaoParam.fmProduto1.meProduto.Text))
      else
        QRProdutoSubstTrib.SetVariable('COD_PRODUTO',null);
      if trim(FTributacaoParam.FmEstado1.MeEstado.Text) <> '' then
        QRProdutoSubstTrib.SetVariable('COD_ESTADO',trim(FTributacaoParam.FmEstado1.MeEstado.Text))
      else
        QRProdutoSubstTrib.SetVariable('COD_ESTADO',null);
      QRProdutoSubstTrib.Open();
      if QRProdutoSubstTrib.RecordCount > 0 then
      begin
        if FRProdutoSubstTrib = Nil then
          FRProdutoSubstTrib := TFRProdutoSubstTrib.Create(Application);
        FRProdutoSubstTrib.QRLTitulo.Caption := 'Relação de Produtos com Substituição Tributária';
        if FTributacaoParam.RGPreview.ItemIndex = 0 then
          FRProdutoSubstTrib.QRPrimario.Preview
        else
          FRProdutoSubstTrib.QRPrimario.Print;
      end
      else
        ShowMessage('Nenhum registro encontrado');
    end;
  end;
end;

procedure TFProdutoSubstTrib.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;


procedure TFProdutoSubstTrib.FormActivate(Sender: TObject);
begin
  inherited;
  DMTributacao.QTributacao.Open;
end;

procedure TFProdutoSubstTrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMTributacao.QTributacao.Close;
end;

procedure TFProdutoSubstTrib.DBPBaseCalculoSTValidate(Sender: TObject;
  Value: Variant; var isValid: Boolean; var Msg: String);
begin
  inherited;
  with DMTributacao do
  begin
    if (QProdutoSubstTribCOD_TRIBUTACAO.Value = 0) and ((Value = Null) or (Value = 0)) then
    begin
      isValid := False;
      Msg := 'Preenchimento obrigatório quando tributação não informada.';
    end
    else
    begin
      if (QTributacaoCOD_TRIBUTACAO.Value <> QProdutoSubstTribCOD_TRIBUTACAO.Value) then
      begin
        QTributacao.Close;
        QTributacao.SetVariable('PK', QProdutoSubstTribCOD_TRIBUTACAO.Value);
        QTributacao.Open;
      end;
      if ((pos(Copy(QTributacaoDESC_SITUACAO_TRIB.Value,2,2),',10,30,70,') > 0) or
          (pos(QTributacaoDESC_CSOSN.Value,',201,202,203,') > 0)) and
         ((Value = Null) or (Value = 0)) then
      begin
        isValid := False;
        Msg := 'Preenchimento obrigatório quando tributação configurada para calcular ST.';
      end;
      if (pos(Copy(QTributacaoDESC_SITUACAO_TRIB.Value,2,2),',10,30,70,90,') = 0) and
         (pos(QTributacaoDESC_CSOSN.Value,',201,202,203,900,') = 0) and
         (QProdutoSubstTribCOD_TRIBUTACAO.Value > 0) and
         (Value <> Null) and (Value > 0) then
      begin
        isValid := False;
        Msg := 'Deve estar em branco quando tributação não configurada para calcular ST.';
      end;
    end;
  end;
end;

procedure TFProdutoSubstTrib.DBPTributacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFProdutoSubstTrib.AtualizarMVApeloNCM1Click(Sender: TObject);
var
  wMvaSimples, wMvaNormal : double;
  wFilial,wNcm : Integer;
  wEstado: string;
  wMensagem: string;
begin
  inherited;
  with DMTributacao do
  begin
    if FTributacaoParam = Nil then
      FTributacaoParam := TFTributacaoParam.Create(Application);
    FTributacaoParam.PGRelatorio.Pages[2].TabVisible := true;
    if FTributacaoParam.ShowModal = MrOk then
    begin
    if trim(FTributacaoParam.FmFilial2.MeFilial.Text) = '' then
      raise Exception.Create('Informe uma Filial.');

    if trim(FTributacaoParam.FmNcm2.MeNcm.Text) = '' then
      raise Exception.Create('Informe um NCM válido.');

    if ((trim(FTributacaoParam.MeMVASimples.Text) = '') and (trim(FTributacaoParam.MeMVANormal.Text) = '')) then
      raise Exception.Create('Preencha os campos MVA Normal ST ou MVA Simples Nacional ST.');

    wFilial := strtoint(trim(FTributacaoParam.FmFilial2.MeFilial.Text));
    wNcm := strtoint(trim(FTributacaoParam.FmNcm2.MeNcm.Text));
    wMvaSimples := strtofloat(trim(FTributacaoParam.MeMVASimples.text));
    wMvaNormal :=  strtofloat(trim(FTributacaoParam.MeMVANormal.text));
    wEstado := Trim(FTributacaoParam.FmEstado2.MeEstado.Text);

    wMensagem := 'Deseja atualizar a MVA de todo os produtos com NCM ' + FTributacaoParam.FmNcm2.MeNcm.Text;
    if wEstado <> '' then
      wMensagem := wMensagem + ' do estado ' + wEstado;
    wMensagem := wMensagem + '?';

    if MessageDlg(wMensagem,mtConfirmation,[mbYes,mbNo], 0) = mrYes then
    begin
      try
        OPReajustaMVAPorNcm.CallProcedure('PROC_REAJUSTA_MVA_PORNCM', [wfilial,wNcm,wEstado,wMvaSimples,wMvaNormal]);
        ShowMessage('MVA reajustada com sucesso.');
      except
        on E:EOracleError do showmessage(E.Message);
      end;
      if not QProdutoSubstTrib.Eof then
        SBRefreshClick(self);
    end
    else
      ShowMessage('Os dados não foram atualizados.');
   end; //end showmodal
  end;
end;

procedure TFProdutoSubstTrib.ProdutoSTporNCM1Click(Sender: TObject);
begin
  inherited;
  if FTributacaoParam = Nil then
    FTributacaoParam := TFTributacaoParam.Create(Application);

  FTributacaoParam.AtivaPagina(3);

    if FTributacaoParam.ShowModal = MrOk then
    begin

      if trim(FTributacaoParam.FmFilial3.MeFilial.Text) = '' then
        raise Exception.Create('Informe uma Filial.');

      if trim(FTributacaoParam.FmNcm3.MeNcm.Text) = '' then
        raise Exception.Create('Informe um NCM válido.');

      if ((trim(FTributacaoParam.MEMvaSTSimples3.Text) = '') and (trim(FTributacaoParam.MEMvaSTNormal3.Text) = '')) then
        raise Exception.Create('Preencha os campos MVA Normal ST ou MVA Simples Nacional ST.');

      if (trim(FTributacaoParam.MEAliquotaST3.Text) = '') or (trim(FTributacaoParam.MEAliquotaDif3.Text)= '') then
        raise Exception.Create('Preencha os campos Aliquota ST e Aliquota Estadual Interna.');    

      if trim(FTributacaoParam.FMTributacao3.MeTributacao.Text) = '' then
        raise Exception.Create('Preencha o campo Tributação.');


      if DMProduto = nil then
        DMProduto := TDMProduto.Create(Application);

      with DMProduto, DMTributacao do
      begin
        QProdutoNCM.Close;
        QProdutoNCM.SetVariable('NCM', FTributacaoParam.FmNcm3.MeNcm.Text);
        QProdutoNCM.SetVariable('COD_ESTADO', FTributacaoParam.FmEstado3.MeEstado.Text);
        QProdutoNCM.SetVariable('COD_TRIBUTACAO', StrToInt(trim(FTributacaoParam.FMTributacao3.MeTributacao.Text)));
        QProdutoNCM.Open;

        while not QProdutoNCM.Eof do
        begin

          QProdutoSubstTrib.Open;
          QProdutoSubstTrib.Append;

          QProdutoSubstTribCOD_FILIAL.Value := StrToInt(Trim(FTributacaoParam.FmFilial3.MeFilial.Text));
          QProdutoSubstTribCOD_PRODUTO.Value := QProdutoNCMCOD_PRODUTO.AsInteger;
          QProdutoSubstTribCOD_ESTADO.Value := FTributacaoParam.FmEstado3.MeEstado.Text;
          QProdutoSubstTribPERC_TRIBUTADO_SN.Value := StrToFloat(FTributacaoParam.MEMvaSTSimples3.Text);
          QProdutoSubstTribPERC_TRIBUTADO.Value := StrToFloat(FTributacaoParam.MEMvaSTNormal3.Text);
          QProdutoSubstTribPERC_ALIQUOTA.Value := StrToFloat(FTributacaoParam.MEAliquotaST3.Text);
          QProdutoSubstTribPERC_ALIQUOTA_DIFERENCIAL.Value := StrToFloat(FTributacaoParam.MeAliquotaDif3.Text);
          QProdutoSubstTribCOD_TRIBUTACAO.Value := StrToInt(trim(FTributacaoParam.FMTributacao3.MeTributacao.Text));

          QProdutoSubstTrib.Post;
          QProdutoSubstTrib.Close;

          QProdutoNCM.Next;

        end;

        ShowMessage('Produtos inseridos com sucesso! ' + IntToStr(QProdutoNCM.RecordCount) + ' produtos incluídos.');

      end;

    end;
end;

end.
