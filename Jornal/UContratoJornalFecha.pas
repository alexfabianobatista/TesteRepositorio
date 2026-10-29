unit UContratoJornalFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls,
  DBPanel, Mask, DBCtrls, ImgList, UFmFinalidade;

type
  TFContratoJornalFecha = class(TForm)
    PCFechaContrato: TPageControl;
    TSContasReceber: TTabSheet;
    CBGeraCR: TComboBox;
    BtGerarContaReceber: TBitBtn;
    DBGFechaGeraCR: TDBGrid;
    DSFechaGeraCR: TDataSource;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    BtRetornar: TBitBtn;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    ILBotaoNext: TImageList;
    FmFinalidade: TFmFinalidade;
    procedure BtGerarContaReceberClick(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure BtRetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FmFinalidade1MeFinalidadeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function RoundToUp(Value: Extended): Integer;
    procedure LimpaCR;
    procedure GeraCRPorEdicao(Intervalo: Integer);
  protected
    procedure Next;
    procedure Previous;
    procedure UpdateControls;
    function IsLastPage: Boolean;
    procedure Finish;
  end;

var
  FContratoJornalFecha: TFContratoJornalFecha;

const
  CAPTION_AVANCAR: String = '&Próximo';
  CAPTION_CONCLUIR: String = '&Concluir';

implementation

uses UContratoJornal_cl, Math, UContratoFecha_cl, UOracle_cl, StrUtils;

{$R *.dfm}

{ TFContratoJornalFecha }

procedure TFContratoJornalFecha.GeraCRPorEdicao(Intervalo: Integer);
var
  nItens: Integer;
  total: Extended;
  datas: Array of TDateTime;
begin
  if Intervalo <= 0 then
    Exit;
  with DMContratoFecha do
    with DMContratoJornal do
    begin
      nItens := QContratoJornalItem.RecordCount;
      total := 0;
      SetLength(datas, RoundToUp(nItens / Intervalo));
      QContratoJornalItem.First;
      while not QContratoJornalItem.Eof do
      begin
        if QContratoJornalItem.RecNo mod Intervalo = 0 then
        begin
          datas[Trunc(QContratoJornalItem.RecNo / Intervalo) - 1] := QContratoJornalItemDT_EDICAO.Value;
          QContratoJornalItem.Next;
        end
        else
        begin
          QContratoJornalItem.Next;
          if QContratoJornalItem.Eof then
            datas[Trunc(QContratoJornalItem.RecNo / Intervalo)] := QContratoJornalItemDT_EDICAO.Value;
        end;
      end;
      QContratoJornalItem.First;
      while not QContratoJornalItem.Eof do
      begin
        CDSFechaGeraCR.Append;
        CDSFechaGeraCRCOD_CONTRATO_JORNAL_ITEM.Value := QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM.Value;
        CDSFechaGeraCRNUM_EDICAO.Value := QContratoJornalItemNUM_EDICAO.Value;
        CDSFechaGeraCRVAL_CONTA_RECEBER.Value := RoundTo(QContratoJornalVAL_CONTRATO.Value / nItens, -2);
        CDSFechaGeraCRDT_VENCIMENTO.Value := datas[Trunc((QContratoJornalItem.RecNo - 1) / Intervalo)];
        CDSFechaGeraCR.Post;

        QContratoJornalItem.Next;
        if QContratoJornalItem.Eof then
        begin
          CDSFechaGeraCR.Edit;
          CDSFechaGeraCRVAL_CONTA_RECEBER.Value := QContratoJornalVAL_CONTRATO.Value - total;
          CDSFechaGeraCR.Post;
        end
        else
          total := total + CDSFechaGeraCRVAL_CONTA_RECEBER.Value;
      end;
    end;
end;

procedure TFContratoJornalFecha.LimpaCR;
begin
  with DMContratoFecha do
  begin
    CDSFechaGeraCR.Close;
    CDSFechaGeraCR.Open;
    CDSFechaGeraCR.First;
    while not CDSFechaGeraCR.Eof do
      CDSFechaGeraCR.Delete;
  end;
end;

function TFContratoJornalFecha.RoundToUp(Value: Extended): Integer;
begin
  Result := Trunc(Value) + IfThen(Value > Trunc(Value), 1);
end;

procedure TFContratoJornalFecha.BtGerarContaReceberClick(Sender: TObject);
begin
  if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    LimpaCR;
    GeraCRPorEdicao(CBGeraCR.ItemIndex + 1);
  end;
end;

procedure TFContratoJornalFecha.Next;
begin
  PCFechaContrato.SelectNextPage(True);
  UpdateControls;
end;

procedure TFContratoJornalFecha.Previous;
begin
  PCFechaContrato.SelectNextPage(False);
  UpdateControls;
end;

procedure TFContratoJornalFecha.UpdateControls;
begin
  ILBotaoNext.GetBitmap(0, BtRetornar.Glyph);
  ILBotaoNext.GetBitmap(1, BtCancelar.Glyph);
  BtRetornar.Enabled := (PCFechaContrato.ActivePageIndex > 0);
  if IsLastPage then
  begin
    BtAvancar.Caption := CAPTION_CONCLUIR;
    ILBotaoNext.GetBitmap(3, BtAvancar.Glyph);
  end
  else
  begin
    BtAvancar.Caption := CAPTION_AVANCAR;
    ILBotaoNext.GetBitmap(2, BtAvancar.Glyph);
  end
end;

function TFContratoJornalFecha.IsLastPage: Boolean;
begin
  Result := (PCFechaContrato.ActivePageIndex = (PCFechaContrato.PageCount - 1));
end;

procedure TFContratoJornalFecha.BtAvancarClick(Sender: TObject);
begin
  if IsLastPage then
    Finish
  else
    Next;
end;

procedure TFContratoJornalFecha.BtRetornarClick(Sender: TObject);
begin
  Previous;
end;

procedure TFContratoJornalFecha.FormActivate(Sender: TObject);
begin
  UpdateControls;
end;

procedure TFContratoJornalFecha.BtCancelarClick(Sender: TObject);
begin
  if (MessageDlg('Cancelar o fechamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Close;
end;

procedure TFContratoJornalFecha.Finish;
  procedure LocalizaItem(Codigo: Integer);
  begin
    with DMContratoJornal do
      if QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM.Value = Codigo then
        Exit
      else
      begin
        QContratoJornalItem.First;
        while not (QContratoJornalItem.Eof or (QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM.Value = Codigo)) do
          QContratoJornalItem.Next;
        if QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM.Value <> Codigo then
          raise Exception.Create('Item ' + IntToStr(Codigo) + ' não encontrado no contrato.');
      end;
  end;
begin
  if (MessageDlg('Fechar o contrato?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    Exit;
  if Trim(FmFinalidade.MeFinalidade.Text) = '' then
  begin
    MessageDlg('Por favor, informe uma finalidade para gerar as contas à receber.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if DMOracle.FastSelect('COD_FINALIDADE', 'TB_FINALIDADE',
      'COD_FINALIDADE = ' + FmFinalidade.MeFinalidade.Text) = '' then
  begin
    MessageDlg('Finalidade não encontrada no sistema. Confira se ela foi informada corretamente.', mtInformation, [mbOK], 0);
    Exit;
  end;
  with DMContratoFecha do
    with DMContratoJornal do
      try
        if CDSFechaGeraCR.IsEmpty then
        begin
          MessageDlg('Por favor, gere contas à receber primeiro.', mtInformation, [mbOK], 0);
          Exit;
        end;
        QGeraCRCad.Close;
        QGeraCRCad.Open;
        CDSFechaGeraCR.First;
        while not CDSFechaGeraCR.Eof do
        begin
          QGeraCRCad.Append;
          QGeraCRCadCOD_CADASTRO.Value := QContratoJornalCOD_CADASTRO.Value;
          QGeraCRCadCOD_VENDEDOR.Value := QContratoJornalCOD_VENDEDOR.Value;
          QGeraCRCadCOD_FILIAL.Value := QContratoJornalCOD_FILIAL.Value;
          QGeraCRCadVAL_TITULO.Value := CDSFechaGeraCRVAL_CONTA_RECEBER.Value;
          QGeraCRCadDT_VENCIMENTO.Value := CDSFechaGeraCRDT_VENCIMENTO.Value;
          QGeraCRCadNUM_TITULO.Value := QContratoJornalCOD_CONTRATO_JORNAL.Value;
          QGeraCRCadCOD_FINALIDADE.Value := StrToInt(Trim(FmFinalidade.MeFinalidade.Text));
          QGeraCRCadNUM_PARCELA.Value := CDSFechaGeraCR.RecNo;
          LocalizaItem(CDSFechaGeraCRCOD_CONTRATO_JORNAL_ITEM.Value);
          QGeraCRCadDESC_OBSERVACAO.Value := 'EDICAO ' +
            CDSFechaGeraCRNUM_EDICAO.Text + IfThen(not QContratoJornalItemIND_TIPO.IsNull,
            ' TIPO ' + QContratoJornalItemIND_TIPO.Value) + ' CONTRATO NUMERO ' +
            QContratoJornalCOD_CONTRATO_JORNAL.Text;

          QContratoJornalItem.Edit;
          QContratoJornalItemCOD_CONTA_RECEBER_CAB.Value := QGeraCRCadCOD_CONTA_RECEBER_CAB.Value;

          QGeraCRCad.Post;
          QContratoJornalItem.Post;


          CDSFechaGeraCR.Next;
        end;

        QContratoJornal.Edit;
        QContratoJornalIND_SITUACAO.Value := SIT_CONTRATO_FECHADO;
        QContratoJornal.Post;

        DMOracle.DBCemapa.Commit;
        Close;
      except
        DMOracle.DBCemapa.Rollback;
        raise;
      end;
end;

procedure TFContratoJornalFecha.FormShow(Sender: TObject);
begin
  LimpaCR;
end;

procedure TFContratoJornalFecha.FmFinalidade1MeFinalidadeExit(
  Sender: TObject);
begin
  FmFinalidade.MeFinalidadeExit(Sender);
  if FmFinalidade.MeFinalidade.Text = '' then
    FmFinalidade.EdFinalidade.Text := 'Informe uma finalidade para as contas à receber';
end;

procedure TFContratoJornalFecha.FormCreate(Sender: TObject);
begin
  FmFinalidade.MeFinalidade.Text := '1';
  FmFinalidade.MeFinalidadeExit(Sender);
end;

end.
