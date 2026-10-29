unit UReinfR2055;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, UReinf_cl, Grids, DBGrids, DBCtrls, UFmCadastro,
  UFmFilial, UCadastro_cl, UFilial_cl, UBiblioteca, UBibliotecaDB,
  UOracle_cl, UGeraXMLReinf, UConfigurarAquisicao;

type
  TFReinfR2055 = class(TFTCadSimples)
    DBReinfR2055: TDBGrid;
    PageControl1: TPageControl;
    TabAquisicao: TTabSheet;
    TabTipoAquisicao: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbEditValBrudo: TDBEdit;
    dbEditCPDescPR: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbEditDescRat: TDBEdit;
    dbEditDescSenar: TDBEdit;
    dbgTipoAquisicao: TDBGrid;
    bntAdicionaTipoAquisicao: TButton;
    btnRemoveTipoAquisicao: TButton;
    FmFilialR2055: TFmFilial;
    dbcbContribuicaoCP: TDBCheckBox;
    dbcbRetificacao: TDBCheckBox;
    dbcbRetifS1250: TDBCheckBox;
    Label7: TLabel;
    dbeRetifS1250: TDBEdit;
    Label1: TLabel;
    dtpkDataReferencia: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    dbgProcessos: TDBGrid;
    btnAdicionaProc: TButton;
    btnRemoveProc: TButton;
    cbTipoAquisicao: TComboBox;
    BtProcesso: TBitBtn;
    EdProcesso: TEdit;
    BtSuspensao: TBitBtn;
    EdSuspensao: TEdit;
    Label9: TLabel;
    DBProcesso: TDBEdit;
    DBSuspensao: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    btnGerarEvento: TButton;
    ConfigurarOperaes1: TMenuItem;
    Operaes1: TMenuItem;
    DBECpfCnpj: TDBEdit;
    Label13: TLabel;
    function  ValidaCamposSalvar: boolean;
    procedure FormCreate(Sender: TObject);
    procedure LimparCampos;
    procedure dbcbRetifS1250Click(Sender: TObject);
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure IniciaDadosTela;
    procedure SBExcluirClick(Sender: TObject);
    procedure cbTipoAquisicaoChange(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure bntAdicionaTipoAquisicaoClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure btnRemoveTipoAquisicaoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure btnAdicionaProcClick(Sender: TObject);
    procedure AbreDetailsEdicao;
    procedure FmFilialR2055MeFilialChange(Sender: TObject);
    procedure dtpkDataReferenciaChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BtProcessoClick(Sender: TObject);
    procedure BtSuspensaoClick(Sender: TObject);
    procedure DBReinfR2055CellClick(Column: TColumn);
    procedure dbgTipoAquisicaoCellClick(Column: TColumn);
    procedure FmFilialR2055BtFilialClick(Sender: TObject);
    procedure DBProcessoClick(Sender: TObject);
    procedure btnGerarEventoClick(Sender: TObject);
    procedure dbcbRetificacaoClick(Sender: TObject);
    procedure Operaes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinfR2055: TFReinfR2055;
  BibDB: TBibliotecaDB;
  wCodCadastro: String;


implementation

uses UConsultaProcessoR1070, USuspensaoProcessoCons, UUsuario_cl, DateUtils;


{$R *.dfm}

procedure TFReinfR2055.FormCreate(Sender: TObject);
begin
  inherited;
  IniciaDadosTela;
  AtivarDesativarCampos(TButton(SBCancelar));
  PageControl1.ActivePage := TabAquisicao;
end;

procedure TFReinfR2055.IniciaDadosTela;
begin
  with DMReinf do
  begin
    QReinfR2055.Open;
    QReinfR2055Cons.Open;
    QAquisicaoR2055.Open;
    QAquisicaoR2055Cons.SetVariable('cod_registro_reinf', QReinfR2055COD_REINF_R2055.Value);
    QAquisicaoR2055Cons.Open;
    QTipoAquisicaoXR1070.Open;
    QTipoAquisicaoXR1070Cons.SetVariable('PK', QAquisicaoR2055COD_R2055_X_AQUISICAO.Value);
    QTipoAquisicaoXR1070Cons.Open;
    dtpkDataReferencia.DateTime := Today;
  end;
end;

procedure TFReinfR2055.dbcbRetifS1250Click(Sender: TObject);
begin
  inherited;
  Label7.Visible := dbcbRetifS1250.Checked;
  dbeRetifS1250.Visible := dbcbRetifS1250.Checked;
  dbeRetifS1250.Enabled := dbcbRetifS1250.Checked;
  if dbcbRetifS1250.Checked then
    Label7.Caption := 'Recibo à Retificar S1250'
  else
    Label7.Caption := 'Recibo do evento R-2055 anterior.';
    
end;

procedure TFReinfR2055.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin
  wCodCadastro := '';
  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  FmFilialR2055.Enabled := isAtivo;
  dbcbRetificacao.Enabled := isAtivo;
  dbcbRetifS1250.Enabled := isAtivo;
  dbcbContribuicaoCP.Enabled := isAtivo;
  dtpkDataReferencia.Enabled := isAtivo;
  cbTipoAquisicao.Enabled := isAtivo;
  dbEditValBrudo.Enabled := isAtivo;
  dbEditCPDescPR.Enabled := isAtivo;
  dbEditDescRat.Enabled := isAtivo;
  dbEditDescSenar.Enabled := isAtivo;
  DBECpfCnpj.Enabled :=  isAtivo;

  if (DSPrimario.State = dsInsert) then
  begin
    dbcbRetificacao.Checked := false;
    dbcbRetifS1250.Checked := false;
    dbcbRetifS1250Click(Self);
    dbcbContribuicaoCP.Checked := false;
  end;

end;

procedure TFReinfR2055.SBExcluirClick(Sender: TObject);
begin  
  with DMOracle, DMReinf do
  begin
    if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if (GeraXml.ValidaEventoReinf(QReinfR2055COD_REINF_R2055.Value, 'R-2055')) then
      begin
        QTipoAquisicaoXR1070.First;
        while not QAquisicaoR2055.Eof do
        begin
          ExecutaSql(MontaDelete('TB_R1070_X_AQUISICAO_R2055', 'COD_TABELA_REINF = '+ QuotedStr('R-2055') +
                                                                  ' AND COD_REGISTRO_REINF = ' + QAquisicaoR2055COD_R2055_X_AQUISICAO.Text), true);
          btnRemoveTipoAquisicaoClick(Self);
          QAquisicaoR2055.Next;
        end;

      inherited;
      LimparCampos;
      AtivarDesativarCampos(TButton(Sender));         
    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
  end
  else
      ShowMessage('Cancelado pelo usuário!');
  end;
  
end;

procedure TFReinfR2055.cbTipoAquisicaoChange(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if (DSPrimario.State in [dsInsert, dsEdit]) then
    begin
      if (QAquisicaoR2055.State in [dsInactive, dsBrowse]) then
        QAquisicaoR2055.Insert;

      if cbTipoAquisicao.ItemIndex > 0 then
        DMReinf.QAquisicaoR2055IND_AQUISICAO.Value := cbTipoAquisicao.ItemIndex
      else
        Raise Exception.Create('Tipo de aquisição é obrigatório.');
    end;
  end;

end;

procedure TFReinfR2055.SBAlterarClick(Sender: TObject);
begin
  with DMOracle, DMReinf do
  begin
    if (GeraXml.ValidaEventoReinf(QReinfR2055COD_REINF_R2055.Value, 'R-2055')) then
      inherited;
      AtivarDesativarCampos(TButton(Sender));
      AbreDetailsEdicao;
  end;       
end;

procedure TFReinfR2055.bntAdicionaTipoAquisicaoClick(Sender: TObject);
begin
  with DMReinf, DMOracle do
  begin
    if (QAquisicaor2055Cons.RecordCount < 7) then
    begin
      if (QReinfR2055.State in [dsEdit, dsInsert]) then
      begin
        if not (QAquisicaoR2055.State in [dsEdit, dsInsert])  then
          QAquisicaoR2055.Insert;

        QAquisicaoR2055COD_REGISTRO_REINF.Value := QReinfR2055COD_REINF_R2055.Value;
        QAquisicaoR2055COD_TABELA_REINF.Value := 'R-2055';

        QAquisicaoR2055Check.Open;

        if (BuscaNome('SELECT IND_AQUISICAO from TB_R2055_X_AQUISICAO' , 'TB_R2055_X_AQUISICAO.cod_registro_reinf = ' + QReinfR2055COD_REINF_R2055.Text +
        ' AND TB_R2055_X_AQUISICAO.COD_TABELA_REINF = ' +  QuotedStr('R-2055') +  ' AND TB_R2055_X_AQUISICAO.IND_AQUISICAO = ' +
        IntToStr(cbTipoAquisicao.ItemIndex)) <> '0') then
          Raise Exception.Create('O TIPO DE AQUISICÃO já foi utilizado. Exclua antes de continuar.')
        else
        begin
          QAquisicaoR2055.Post;
          QAquisicaoR2055Cons.Refresh;
        end;
      end
      else
        Raise Exception.Create('O registro não se encontra em edição.');
    end
    else
      Raise Exception.Create('Quantidade máxima de detalhamento é 6 itens.');
  end;

  dbgTipoAquisicao.DataSource.DataSet.Refresh;
  inherited;      
end;

procedure TFReinfR2055.SBIncluirClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(SBIncluir));
  LimparCampos;
  AbreDetailsEdicao;
  DMReinf.QReinfR2055COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TFReinfR2055.btnRemoveTipoAquisicaoClick(Sender: TObject);
begin
  inherited;
  with DMReinf, DMOracle do
  begin
    if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                    QuotedStr('R-2055') +  ' AND COD_REINF_PERIODO = ' + QReinfR2055COD_REINF_R2055.Text) = '0') then
    begin
      if QReinfR2055.State in [dsEdit, dsInsert] then
      begin
        if QAquisicaoR2055Cons.RecordCount > 0 then
        begin
          if QAquisicaoR2055Cons.RecNo <> -1 then
          begin

            if QAquisicaoR2055.State <> dsBrowse then
            begin
              QAquisicaoR2055.Close;
              QAquisicaoR2055.ClearVariables;
              QAquisicaoR2055.Open;
            end;

            ExecutaSql(MontaDelete('TB_R1070_X_AQUISICAO_R2055', 'COD_TABELA_REINF = '+ QuotedStr('R-2055') +
                                                                  ' AND COD_REGISTRO_REINF = ' + QAquisicaoR2055ConsCOD_R2055_X_AQUISICAO.Text), true);
            ExecutaSql(MontaDelete('TB_R2055_X_AQUISICAO', 'COD_TABELA_REINF = '+ QuotedStr('R-2055') +
                                                                  ' AND COD_R2055_X_AQUISICAO = ' + QAquisicaoR2055ConsCOD_R2055_X_AQUISICAO.Text), true);
          end;
        end
        else
          Raise Exception.Create('Não existem dados para serem excluídos!');
        dbgTipoAquisicao.DataSource.DataSet.Refresh;
        QAquisicaoR2055.Close;
        QAquisicaoR2055.Open;
      end
      else
        Raise Exception.Create('O registro não encontra-se em edição.');
    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
  end;

end;

procedure TFReinfR2055.LimparCampos;
begin

  FmFilialR2055.MeFilial.Clear;
  FmFilialR2055.EdFilial.Clear;
  DBECpfCnpj.Clear;
  dbcbRetificacao.Checked := false;
  dbcbRetifS1250.Checked := false;
  dbcbContribuicaoCP.Checked :=  false;
  dtpkDataReferencia.Checked :=  false;
  cbTipoAquisicao.ItemIndex := 0;
  dbEditValBrudo.Clear;
  dbEditCPDescPR.Clear;
  dbEditDescRat.Clear;
  dbEditDescSenar.Clear;

end;

procedure TFReinfR2055.SBConfirmarClick(Sender: TObject);
begin
  with DMReinf, DMFilial do
  begin

    if Trim(FmFilialR2055.MeFilial.Text) <> '' then
      QReinfR2055COD_FILIAL.Text :=  Trim(FmFilialR2055.MeFilial.Text);

    QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;

    QReinfR2055DT_PERIODO_APURACAO.Value := dtpkDataReferencia.DateTime;

    if dbcbRetificacao.Checked then
      QReinfR2055IND_RETIFCACAO.Text := dbcbRetificacao.ValueChecked
    else
      QReinfR2055IND_RETIFCACAO.Text := dbcbRetificacao.ValueUnchecked;

    if dbcbContribuicaoCP.Checked then
      QReinfR2055IND_OPCAO_CP.Text := dbcbContribuicaoCP.ValueChecked
    else
      QReinfR2055IND_OPCAO_CP.Text := dbcbContribuicaoCP.ValueUnchecked;


    if ValidaCamposSalvar then
    begin
      QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Value := DMFilial.QFilialIND_AMBIENTE_REINF.Value;
      QReinfR2055IND_TIPO_APLICATIVO.Value := 1;

      inherited;
      AtivarDesativarCampos(TButton(Sender));
    end
    else
      Raise Exception.Create('Verifique se todos os campos foram preenchidos!');
  end;
end;

procedure TFReinfR2055.SBCancelarClick(Sender: TObject);
begin

  if Dialogs.MessageDlg('Tem certeza que quer cancelar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    LimparCampos;
    with DMReinf do
    begin
      QAquisicaoR2055.Cancel;
    end;
    inherited;
    AtivarDesativarCampos(TButton(Sender));
  end;


end;

procedure TFReinfR2055.btnAdicionaProcClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    //verifica a quantidade de processos antes de inserir. Limitado pelo autorizado no layout
    if (QTipoAquisicaoXR1070Cons.RecordCount < 50) then
    begin

      if QReinfR2055.State in [dsInsert, dsEdit] then
      begin

        if Trim(DBProcesso.Text) <> '' then   //verifica se foi selecionado processo
        begin
          QTipoAquisicaoXR1070.Post;
          QAquisicaoR2055.Post;     
        end;
      end;
      QTipoAquisicaoXR1070Cons.Refresh;
      dbgTipoAquisicao.Refresh;
    end
    else
     Raise Exception.Create('O máximo de processos por aquisição é 50.');
  end;

end;


procedure TFReinfR2055.AbreDetailsEdicao;
begin
  with DMReinf do
  begin
    QAquisicaoR2055Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2055ConsCOD_REINF_R2055.Value);
    QAquisicaoR2055Cons.Open;
  end;

end;

procedure TFReinfR2055.FmFilialR2055MeFilialChange(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if Trim(FmFilialR2055.MeFilial.Text) <> '' then
    begin
      QReinfR2055COD_FILIAL.Text := Trim(FmFilialR2055.MeFilial.Text);
      wCodCadastro := wCodCadastro+ ', ' + Trim(FmFilialR2055.MeFilial.Text);
    end;
  end;
end;

procedure TFReinfR2055.dtpkDataReferenciaChange(Sender: TObject);
var
  DataInicioEvento : TDate;
begin
  inherited;
  with DMReinf do
  begin
    QReinfR2055DT_PERIODO_APURACAO.Value := dtpkDataReferencia.DateTime;

    DataInicioEvento := StrToDate('21/07/2021');
    if (dtpkDataReferencia.Date < DataInicioEvento) and not (dbcbRetificacao.Checked) then
    begin
      if dbcbRetifS1250.Checked then
      begin
        dbeRetifS1250.Visible := not dbcbRetificacao.Checked;
        dbeRetifS1250.Enabled := not dbcbRetificacao.Checked;
        Label7.Visible := not dbcbRetificacao.Checked;
        Label7.Caption := 'Recibo do S-1250 à retificar.';
      end;
      dbcbRetifS1250.Enabled := not dbcbRetificacao.Checked;
      dbcbRetifS1250.Visible := not dbcbRetificacao.Checked;
    end
    else if (dbcbRetificacao.Checked) then
    begin
      dbcbRetifS1250.Enabled := not dbcbRetificacao.Checked;
      dbcbRetifS1250.Visible := not dbcbRetificacao.Checked;
      dbcbRetifS1250.Checked := not dbcbRetificacao.Checked;
      dbeRetifS1250.Visible := dbcbRetificacao.Checked;
      dbeRetifS1250.Enabled := dbcbRetificacao.Checked;
      Label7.Visible := dbcbRetificacao.Checked;
      Label7.Caption := 'Recibo à retificar.';
    end
    else if (dtpkDataReferencia.Date > DataInicioEvento) and not (dbcbRetificacao.Checked) then
    begin
      dbcbRetifS1250.Enabled := dbcbRetificacao.Checked;
      dbcbRetifS1250.Visible := dbcbRetificacao.Checked;
      dbeRetifS1250.Visible := dbcbRetificacao.Checked;
      dbeRetifS1250.Enabled := dbcbRetificacao.Checked;
      Label7.Visible := dbcbRetificacao.Checked;
      dbeRetifS1250.Clear;
    end;
  end;
end;

function TFReinfR2055.ValidaCamposSalvar: boolean;
begin

  with DMReinf do
  begin
    if ((QReinfR2055COD_REINF_R2055.IsNull) or (QReinfR2055COD_REINF_R2055.Text = EmptyStr)) or
       ((QReinfR2055DT_PERIODO_APURACAO.IsNull) or (QReinfR2055DT_PERIODO_APURACAO.Text = EmptyStr)) or
       ((QReinfR2055IND_PRODUCAO_HOMOLOGACAO.IsNull) or (QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Text = EmptyStr)) or
       ((QReinfR2055COD_FILIAL.IsNull) or (QReinfR2055COD_FILIAL.Text = EmptyStr)) then
      result := false
    else
      result := true;
  end;

end;

procedure TFReinfR2055.PageControl1Change(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin

    if QReinfR2055.State in [dsEdit, dsInsert] then
    begin
      SBConfirmarClick(TButton(SBConfirmar));
      SBAlterarClick(TButton(SBAlterar));

      if not (QAquisicaoR2055.State in [dsEdit, dsInsert]) then
      begin
        QAquisicaoR2055Cons.Close;
        QAquisicaoR2055Cons.SetVariable('cod_registro_reinf', QReinfR2055ConsCOD_REINF_R2055.Value);
        QAquisicaoR2055Cons.Open;

        if QAquisicaoR2055Cons.RecordCount < 7 then
        begin
          QAquisicaoR2055.Open;
          QAquisicaoR2055.Insert;
        end;
      end;
    end
    else
    begin
      if (QAquisicaoR2055.State in [dsBrowse])  then
      begin
        QAquisicaoR2055Cons.Close;
        QAquisicaoR2055Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2055ConsCOD_REINF_R2055.Value);
        QAquisicaoR2055Cons.Open;

        if (QAquisicaoR2055Cons.RecordCount > 0) and (QTipoAquisicaoXR1070.State in [dsBrowse]) then
        begin
            QTipoAquisicaoXR1070Cons.Close;
            QTipoAquisicaoXR1070Cons.SetVariable('PK', QAquisicaoR2055COD_R2055_X_AQUISICAO.Value);
            QTipoAquisicaoXR1070Cons.Open
        end;  //if (QAquisicaoR2055Cons.RecordCount > 0) then
      end;  // if (QAquisicaoR2055.State in [dsBrowse])  then
    end;  //else
  end;
end;

procedure TFReinfR2055.BtProcessoClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR2055.State in [dsInsert, dsEdit] then
    begin
      if not (QTipoAquisicaoXR1070.State in [dsEdit, dsInsert]) then
        QTipoAquisicaoXR1070.Insert;
       

      if not (QAquisicaoR2055.State in [dsInsert, dsEdit]) and (QAquisicaoR2055Cons.RecordCount > 0) then
         QAquisicaoR2055.Edit
      else if (QAquisicaoR2055Cons.RecordCount = 0) then
        Raise Exception.Create('Não há registros para adição de processos.');

      if FConsultaProcessoR1070 = nil then
        FConsultaProcessoR1070 := TFConsultaProcessoR1070.Create(Application);
      FConsultaProcessoR1070.ShowModal;
      if FConsultaProcessoR1070.ModalResult = mrOK then
      begin

        if QProcessoR1070Cons.RecordCount > 0 then
        begin
          DBProcesso.Text := QProcessoR1070ConsCOD_REINF_R1070.Text;
          QTipoAquisicaoXR1070COD_REINF_R1070.Value := QProcessoR1070ConsCOD_REINF_R1070.Value;
          QTipoAquisicaoXR1070COD_TABELA_REINF.Value := 'R-2055';
          QTipoAquisicaoXR1070COD_REGISTRO_REINF.Value := QAquisicaoR2055COD_REGISTRO_REINF.Value;
          EdProcesso.Text := QProcessoR1070ConsNUM_PROCESSO.Text + ' Vara: ' + QProcessoR1070ConsNUM_VARA.Text;
        end
        else
        begin
          raise Exception.Create('Não existem processos cadastrados.');
        end;
      end;
    end;
  end;
end;

procedure TFReinfR2055.BtSuspensaoClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR2055.State in [dsEdit, dsInsert] then
    begin
      if not (QTipoAquisicaoXR1070.State in [dsEdit, dsInsert]) then
        QTipoAquisicaoXR1070.Insert;
        
      //Tela de consulta de suspensão
      if FSuspensaoProcCons = nil then
        FSuspensaoProcCons := TFSuspensaoProcCons.Create(Application);

      FSuspensaoProcCons.ShowModal;
      if FSuspensaoProcCons.ModalResult = mrOK then
      begin
        //se não houverem dados, não cadastra nada.
        if QReinfSuspProcessoCons.RecordCount > 0 then
        begin
          QTipoAquisicaoXR1070COD_SUSPENSAO_R1070.Value := QReinfSuspProcessoConsCOD_SUSPENSAO_R1070.Value;
          EdSuspensao.Text := QReinfSuspProcessoConsCOD_IND_SUSPENSAO.Text;
        end
        else
        begin
          raise Exception.Create('Não existem suspensões cadastradas.');
        end;
      end;
    end;
  end;
end;

procedure TFReinfR2055.DBReinfR2055CellClick(Column: TColumn);
begin
  with DMReinf do
  begin
    if (QReinfR2055.State in [dsBrowse]) and (QReinfR2055.RecordCount > 0) then
    begin
      QReinfR2055.Close;
      QReinfR2055.SetVariable('PK', DBReinfR2055.DataSource.DataSet.FieldByName('COD_REINF_R2055').Value);
      QReinfR2055.Open;

      FmFilialR2055.MeFilial.Text := QReinfR2055COD_FILIAL.Text;
      FmFilialR2055.MeFilialExit(Self);

      dtpkDataReferencia.DateTime := QReinfR2055DT_PERIODO_APURACAO.AsDateTime;

      if PageControl1.ActivePage.Name = 'TabTipoAquisicao' then
      begin           
        if (QAquisicaoR2055.State in [dsBrowse])  then
        begin
          QAquisicaoR2055Cons.Close;
          QAquisicaoR2055Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2055ConsCOD_REINF_R2055.Value);
          QAquisicaoR2055Cons.Open;

          if (QAquisicaoR2055Cons.RecordCount > 0) and (QTipoAquisicaoXR1070.State in [dsBrowse]) then
          begin
              QTipoAquisicaoXR1070Cons.Close;
              QTipoAquisicaoXR1070Cons.SetVariable('PK', QAquisicaoR2055COD_R2055_X_AQUISICAO.Value);
              QTipoAquisicaoXR1070Cons.Open
          end;  //if (QAquisicaoR2055Cons.RecordCount > 0) then
        end;  // if (QAquisicaoR2055.State in [dsBrowse])  then
      end;  //if PageControl1.ActivePage.Name = 'TabTipoAquisicao' then
    end;  //if (QReinfR2055.State in [dsBrowse]) and (QReinfR2055.RecordCount > 0) then
  end;
  AtivarDesativarCampos(TButton(SBConfirmar));
  inherited;
  
end;

procedure TFReinfR2055.dbgTipoAquisicaoCellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    if (QReinfR2055.State in [dsBrowse, dsEdit, dsInsert]) and (QAquisicaoR2055Cons.RecordCount > 0) then
    begin
      QTipoAquisicaoXR1070Cons.Close;
      QTipoAquisicaoXR1070Cons.SetVariable('PK', QAquisicaoR2055ConsCOD_R2055_X_AQUISICAO.Value);
      QTipoAquisicaoXR1070Cons.Open;
    end;                            
  end;

end;

procedure TFReinfR2055.FmFilialR2055BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilialR2055.BtFilialClick(Sender);

end;

procedure TFReinfR2055.DBProcessoClick(Sender: TObject);
begin
  with DMReinf do
  begin
    //verifica a quantidade de processos antes de inserir. Limitado pelo autorizado no layout
    if (QTipoAquisicaoXR1070Cons.RecordCount < 50) then
    begin

      if QReinfR2055.State in [dsInsert, dsEdit] then
      begin
        if not (DBProcesso.DataSource.DataSet.State in [dsEdit, dsInsert]) then
          QAquisicaoR2055.Insert;
      end
      else
        Raise Exception.Create('O registro não encontra-se em edição.');

    end
    else
      Raise Exception.Create('Já ultrapasosu o limite de processos permitido no layout.');

  end;
  inherited;

end;

procedure TFReinfR2055.btnGerarEventoClick(Sender: TObject);
var
  GeraXML: TGeraXMLReinf;
begin
  inherited;
  if GeraXML = nil then
    GeraXML := TGeraXMLReinf.Create;

  with DMReinf, DMOracle do
  begin

    // verifica se a query do evento está aberta
    if not (QReinfR2055.State in [dsBrowse]) then
      raise Exception.Create('Não foi possível realizar a geração. O registro deve estar salvo!')
    else
    begin
      if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2055') +  ' AND COD_EVENTO_REINF = ' + QReinfR2055COD_REINF_R2055.Text) = '0') then
      begin
        // verifica se o evento está selecionado
        if Trim(QReinfR2055COD_REINF_R2055.Text) = '' then
          raise Exception.Create('Deve haver um registro selecionado para geração.')
        else
        begin
          GeraXML.GerarR2055(QReinfR2055COD_REINF_R2055.Value, 'R-2055', '1.05.01');
          ShowMessage('Evento ' + IntToStr(QReinfR2055COD_REINF_R2055.Value) + ' gerado.');
        end;
      end
      else
        raise Exception.Create('Este evento já foi gerado!');

    end;
  end;

end;

procedure TFReinfR2055.dbcbRetificacaoClick(Sender: TObject);
begin
  inherited;
  dtpkDataReferenciaChange(Self);
end;

procedure TFReinfR2055.Operaes1Click(Sender: TObject);
begin
  inherited;
  if FTConfigurarAquisicao = nil then
    FTConfigurarAquisicao := TFTConfigurarAquisicao.Create(Application);

  FTConfigurarAquisicao.ShowModal;

  FreeAndNil(FTConfigurarAquisicao);

end;

procedure TFReinfR2055.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMReinf.QReinfPeriodo.Refresh;
end;

end.
