unit UReinfR2010;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, Grids, DBGrids, UFmCadastro, UFmFilial, UReinf_cl,
  DBCtrls, UOracle_cl, UGeraXMLReinf, UUsuario_cl;

type
  TFReinfR2010 = class(TFTCadSimples)
    dbgReinf2010: TDBGrid;
    FmFilialR2010: TFmFilial;
    FmCadastroPresR2010: TFmCadastro;
    FmCadastroTomR2010: TFmCadastro;
    dbeCnpjCno: TDBEdit;
    lblCnpjCno: TLabel;
    cbCnpjCno: TCheckBox;
    dbeTotalBruto: TDBEdit;
    Label1: TLabel;
    dbeBaseRetencao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeTotRetidoPrincipal: TDBEdit;
    Label4: TLabel;
    dbeTotRetidoAdicional: TDBEdit;
    Label5: TLabel;
    dbeTotNaoRetidoPrincipal: TDBEdit;
    Label6: TLabel;
    dbeTotNaoRetidoAdicional: TDBEdit;
    dbcbDesoneraFolhaCPRB: TDBCheckBox;
    dbgNotasR2010: TDBGrid;
    Label7: TLabel;
    btnAdiciona: TButton;
    btnRemove: TButton;
    dbrTipoServico: TDBRadioGroup;
    dbcbRetificacao: TDBCheckBox;
    dbeObsNota: TDBEdit;
    dtpcDataReferencia: TDateTimePicker;
    Label8: TLabel;
    btnGerarEvento: TButton;
    dbeReciboRetif: TDBEdit;
    lblRetif: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FmFilialR2020BtFilialClick(Sender: TObject);
    procedure FmCadastroPresR2010BtCadastroClick(Sender: TObject);
    procedure FmCadastroTomR2010BtCadastroClick(Sender: TObject);
    procedure cbCnpjCnoClick(Sender: TObject);
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure LimpaCampos;
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure FmFilialR2010MeFilialExit(Sender: TObject);
    procedure FmCadastroPresR2010MeCadastroExit(Sender: TObject);
    procedure FmCadastroTomR2010MeCadastroExit(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure dbeObsNotaExit(Sender: TObject);
    procedure dbeObsNotaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure dbgReinf2010CellClick(Column: TColumn);
    procedure SBCancelarClick(Sender: TObject);
    procedure dbcbRetificacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinfR2010: TFReinfR2010;

implementation

uses UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl, UNotaEntrada_cl, UNotaentradaCons,
  DateUtils;

{$R *.dfm}

procedure TFReinfR2010.FormCreate(Sender: TObject);
begin
  inherited;
  FmCadastroPresR2010.Label1.Caption := 'Prestador';
  FmCadastroTomR2010.Label1.Caption := 'Tomador';

  with DMReinf do
  begin
    QReinfR2010.Open;
    QNotaxReinf.Open;
    QReinfR2010Cons.Open;
  end;
  dtpcDataReferencia.DateTime := Today;
  AtivarDesativarCampos(TButton(SBConfirmar));
  LimpaCampos;

end;

procedure TFReinfR2010.FmFilialR2020BtFilialClick(Sender: TObject);
begin
  inherited;
 if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', QFilialConsCod_Filial.Value);
      QFilial.Open;
      QReinfR2010COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR2010.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR2010.EdFilial.Text := QFilialDESC_FILIAL.Text;

      QReinfR2010IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;


    end;
  end;
end;

procedure TFReinfR2010.FmCadastroPresR2010BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);

  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', QCadastroConsCOD_CADASTRO.Value);
      QCadastro.Open;
      QReinfR2010COD_CADASTRO_PRESTADOR.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroPresR2010.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroPresR2010.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;

end;

procedure TFReinfR2010.FmCadastroTomR2010BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);

  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', QCadastroConsCOD_CADASTRO.Value);
      QCadastro.Open;
      QReinfR2010COD_CADASTRO_CONTRATANTE.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroTomR2010.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroTomR2010.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;            

end;

procedure TFReinfR2010.cbCnpjCnoClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin 
    if (cbCnpjCno.Checked) then
    begin
      lblCnpjCno.Caption := 'CNO';
      QReinfR2010IND_TP_CNPJ_CNO.Value := 4;
    end
    else
    begin
      lblCnpjCno.Caption := 'CNPJ';
      QReinfR2010IND_TP_CNPJ_CNO.Value := 1;
    end;
  end;
end;


procedure TFReinfR2010.SBIncluirClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  AtivarDesativarCampos(TButton(Sender));
  dbcbRetificacao.Checked := not (DSPrimario.State in [dsEdit, dsInsert]);
end;

procedure TFReinfR2010.SBAlterarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    QReinfR2010.Close;
    QReinfR2010.SetVariable('PK', dbgReinf2010.DataSource.DataSet.FieldByName('COD_REINF_R2010').Value);
    QReinfR2010.Open;

    FmFilialR2010.EdFilial.Text := QReinfR2010COD_FILIAL.Text;
    FmFilialR2010MeFilialExit(Self);
    FmCadastroPresR2010.MeCadastro.Text := QReinfR2010COD_CADASTRO_PRESTADOR.Text;
    FmCadastroPresR2010MeCadastroExit(Self);
    FmCadastroTomR2010.MeCadastro.Text := QReinfR2010COD_CADASTRO_CONTRATANTE.Text;
    FmCadastroTomR2010MeCadastroExit(Self);
    cbCnpjCno.Checked := (QReinfR2010IND_TP_CNPJ_CNO.Value = 4);

    QNotasReinf2010.Close;
    QNotasReinf2010.SetVariable('COD_REGISTRO_REINF', QReinfR2010COD_REINF_R2010.Value);
    QNotasReinf2010.Open;

  end;
  inherited;
  AtivarDesativarCampos(TButton(Sender));

end;

procedure TFReinfR2010.FmFilialR2010MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialR2010.MeFilial.Text) <> '' then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', StrToInt(Trim(FmFilialR2010.MeFilial.Text)));
      QFilial.Open;
      QReinfR2010COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR2010.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR2010.EdFilial.Text := QFilialDESC_FILIAL.Text;
    end;
  end;

end;

procedure TFReinfR2010.FmCadastroPresR2010MeCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(FmCadastroPresR2010.MeCadastro.Text) <> '' then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', StrToInt(Trim(FmCadastroPresR2010.MeCadastro.Text)));
      QCadastro.Open;
      QReinfR2010COD_CADASTRO_PRESTADOR.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroPresR2010.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroPresR2010.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;

end;

procedure TFReinfR2010.FmCadastroTomR2010MeCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(FmCadastroTomR2010.MeCadastro.Text) <> '' then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', StrToInt(Trim(FmCadastroTomR2010.MeCadastro.Text)));
      QCadastro.Open;
      QReinfR2010COD_CADASTRO_PRESTADOR.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroTomR2010.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroTomR2010.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;

end;

procedure TFReinfR2010.SBConfirmarClick(Sender: TObject);
begin
  with DMReinf do
  begin
    QReinfR2010COD_FILIAL.Text := Trim(FmFilialR2010.MeFilial.Text);
    QReinfR2010COD_CADASTRO_PRESTADOR.Text := Trim(FmCadastroPresR2010.MeCadastro.Text);
    QReinfR2010COD_CADASTRO_CONTRATANTE.Text := Trim(FmCadastroTomR2010.MeCadastro.Text);
    QReinfR2010COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    if(QReinfR2010IND_RETIFCACAO.Value = 1) then
      Sleep(10);

    if (cbCnpjCno.Checked) then
      QReinfR2010IND_TP_CNPJ_CNO.Value := 4;
    QReinfPeriodoDT_INI_EVENTO.Value := dtpcDataReferencia.DateTime;

  end;
  inherited;
  dbgNotasR2010.DataSource.DataSet.Refresh;
  dbgReinf2010.DataSource.DataSet.Refresh;
  AtivarDesativarCampos(TButton(Self));

end;

procedure TFReinfR2010.btnAdicionaClick(Sender: TObject);
begin
  inherited;
    with DMReinf, DMNotaEntrada do
  begin
    if QReinfR2010.State in [dsEdit, dsInsert] then
    begin
      QReinfR2010.Post;
      QReinfR2010.Edit;
      if FNotaEntradaCons = nil then
        FNotaEntradaCons := TFNotaEntradaCons.Create(Application);

      FNotaEntradaCons.ShowModal;
      if FNotaEntradaCons.ModalResult = mrOK then
      begin
        if QNotaEntradaCons.RecordCount > 0 then
        begin
          QNotaxReinf.Close;
          QNotaxReinf.Open;
          QNotaxReinf.Insert;

          QNotaxReinfCOD_TABELA_REINF.Text := 'R-2010';
          QNotaxReinfCOD_REGISTRO_REINF.Value := QReinfR2010COD_REINF_R2010.Value;
          QNotaxReinfCOD_NOTA_CAB.Value := QNotaEntradaConsCOD_NOTA_CAB.Value;
          QNotaxReinf.Post;

        end;
      end;
    end
    else
      Raise Exception.Create('O registro não encontra-se em edição.');
    dbgNotasR2010.DataSource.DataSet.Close;
    dbgNotasR2010.DataSource.DataSet.Open;

  end;


end;

procedure TFReinfR2010.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin
  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  FmFilialR2010.Enabled := isAtivo;
  FmCadastroPresR2010.Enabled := isAtivo;
  FmCadastroTomR2010.Enabled := isAtivo;
  cbCnpjCno.Enabled := isAtivo;
  dbeCnpjCno.Enabled := isAtivo;
  dbeTotalBruto.Enabled := isAtivo;
  dbeTotRetidoPrincipal.Enabled := isAtivo;
  dbeBaseRetencao.Enabled := isAtivo;
  dbeTotRetidoAdicional.Enabled := isAtivo;
  dbeTotNaoRetidoPrincipal.Enabled := isAtivo;
  dbeTotNaoRetidoAdicional.Enabled := isAtivo;
  dbgNotasR2010.Enabled := isAtivo;
  btnAdiciona.Enabled := isAtivo;
  btnRemove.Enabled := isAtivo;
  dbeObsNota.Enabled := isAtivo;
  dbrTipoServico.Enabled := isAtivo;
  dbcbRetificacao.Enabled := isAtivo;
  dtpcDataReferencia.Enabled := isAtivo;
  dbeReciboRetif.Enabled := isAtivo;
  lblRetif.Enabled := isAtivo;

  if Botao.Name = 'SBConfirmar' then
  begin
    cbCnpjCno.Enabled := false;
    dbcbDesoneraFolhaCPRB.Enabled := false;
  end
  else if (DSPrimario.State in [dsEdit]) then
  begin
    cbCnpjCno.Checked := (DMReinf.QReinfR2010IND_TP_CNPJ_CNO.Value = 4);
    dbcbDesoneraFolhaCPRB.Checked := (DMReinf.QReinfR2010IND_CPRB.Value = 1);
  end;
  dbcbDesoneraFolhaCPRB.Enabled := (DSPrimario.State in [dsEdit, dsInsert]);

end;

procedure TFReinfR2010.LimpaCampos;
begin

  FmFilialR2010.EdFilial.Clear;
  FmFilialR2010.MeFilial.Clear;
  FmCadastroPresR2010.MeCadastro.Clear;
  FmCadastroPresR2010.EdCadastro.Clear;
  FmCadastroTomR2010.EdCadastro.Clear;
  FmCadastroTomR2010.MeCadastro.Clear;
  cbCnpjCno.Checked := false;
  dbeCnpjCno.Clear;
  dbeTotalBruto.Clear;
  dbeTotRetidoPrincipal.Clear;
  dbeBaseRetencao.Clear;
  dbeTotRetidoAdicional.Clear;
  dbeTotNaoRetidoPrincipal.Clear;
  dbeTotNaoRetidoAdicional.Clear;
  dbeObsNota.Clear;
  dbcbRetificacao.Checked := false;
  dbgNotasR2010.DataSource.DataSet.Close;

end;

procedure TFReinfR2010.dbeObsNotaExit(Sender: TObject);
begin
  inherited;
  if (dbgNotasR2010.DataSource.DataSet.RecordCount > 0) and
     (dbgNotasR2010.DataSource.DataSet.RecNo >= 0) and
     (dbgNotasR2010.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    dbgNotasR2010.DataSource.DataSet.Post;
end;

procedure TFReinfR2010.dbeObsNotaClick(Sender: TObject);
begin
  inherited;

  with DMReinf do
  begin
    if (dbgNotasR2010.DataSource.DataSet.RecordCount > 0) and
       (dbgNotasR2010.DataSource.DataSet.RecNo >= 0) then
    begin
      QNotaxReinf.Close;
      QNotaxReinf.SetVariable('PK', QNotasReinf2010COD_NOTA_X_REGISTRO_REINF.Value);
      QNotaxReinf.Open;
      QNotaxReinf.Edit;
    end;
  end;
end;



procedure TFReinfR2010.SBExcluirClick(Sender: TObject);
begin

  with DMOracle, DMReinf do
  begin

    if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2010') +  ' AND COD_REINF_PERIODO = ' + QReinfR2010COD_REINF_R2010.Text) = '0') then
    begin

      if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

        with DMReinf, DMOracle do
        begin
          if QReinfR2010.State in [dsBrowse] then
          begin
            QNotaxReinf.Locate('COD_TABELA_REINF;COD_REGISTRO_REINF', VarArrayOf(['R-2010',QReinfR2010COD_REINF_R2010.Value]),[]);
            if QNotaxReinf.RecordCount > 0 then
            begin
              while not QNotaxReinf.Eof do
              begin
                 QNotaxReinf.Delete;
                 QNotaxReinf.First;
              end;
            end;
          end;

        end;
        inherited;
      end
      else
        ShowMessage('Cancelado pelo usuário');

    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
  end;

end;

procedure TFReinfR2010.dbgReinf2010CellClick(Column: TColumn);
begin
  with DMReinf do
  begin
    if QReinfR2010.State in [dsBrowse] then
    begin
      QReinfR2010.Close;
      QReinfR2010.SetVariable('PK', dbgReinf2010.DataSource.DataSet.FieldByName('COD_REINF_R2010').Value);
      QReinfR2010.Open;

      FmFilialR2010.MeFilial.Text := QReinfR2010COD_FILIAL.Text;
      FmFilialR2010.MeFilialExit(Self);
      FmCadastroPresR2010.MECadastro.Text := QReinfR2010COD_CADASTRO_PRESTADOR.Text;
      FMCadastroPresR2010.MeCadastroExit(Self);
      FmCadastroTomR2010.MeCadastro.Text := QReinfR2010COD_CADASTRO_CONTRATANTE.Text;
      FMCadastroTomR2010.MeCadastroExit(Self);
      QNotasReinf2010.Close;
      QNotasReinf2010.SetVariable('COD_REGISTRO_REINF', QReinfR2010COD_REINF_R2010.Value);
      QNotasReinf2010.Open;

    end
    else
      Raise Exception.Create('Os dados não puderam ser abertos! Cancele a operação anterior.');
  end;
  AtivarDesativarCampos(TButton(SBConfirmar));
  inherited;
end;

procedure TFReinfR2010.SBCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  AtivarDesativarCampos(TButton(Self));

end;

procedure TFReinfR2010.dbcbRetificacaoClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if dbcbRetificacao.Checked then
    begin
      dbeReciboRetif.Visible := true;
      lblRetif.Visible := true;
    end
    else
    begin
      dbeReciboRetif.Visible := false;
      lblRetif.Visible := false;
    end;
  end;
end;

end.
