unit UIntegracaoMaxRoteirizador;

interface

uses                                                                         
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UBiblioteca, Math, ExtCtrls, Mask, DateUtils, StrUtils;

type
  TFIntegracaoMaxRoteirizador = class(TForm)
    Panel1: TPanel;
    GBExportar: TGroupBox;
    GroupBox1: TGroupBox;
    BTImportarRetorno: TBitBtn;
    SaveDialog: TSaveDialog;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    BTExportarPedidos: TBitBtn;
    BTExportarNotas: TBitBtn;
    BTExportarAuxiliares: TBitBtn;

    procedure BTExportarPedidosClick(Sender: TObject);
    procedure SubDiretorios(Diretorio: string; var Lista: TStringList);
    procedure BTExportarAuxiliaresClick(Sender: TObject);
    procedure BTExportarNotasClick(Sender: TObject);
    procedure BTImportarRetornoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    arquivo: TextFile;
    function ExportarAuxiliares(MostrarMensagem: Boolean = True; TipoExportacao: String = ''): Boolean;
    procedure ExportaFornecedores;
    procedure ExportaClientes;
    procedure ExportaUsuarios;
  public
    { Public declarations }
  end;

var
  FIntegracaoMaxRoteirizador: TFIntegracaoMaxRoteirizador;

implementation

uses UCadastro_cl, MaskUtils, UProduto_cl, DB, UOracle_cl, UNotaSaida_cl,
  UContasReceber_cl, UPrazoVencimento_cl, UPedido_cl, UUsuario_cl, NfeTypes,
  UCidade_cl, UVeiculo_cl, URamo_cl, URegiao_cl, UVendedor_cl, UFilial_cl,
  UNfe_cl, UFiltroPedidosIntegraMax, UFiltroNotasIntegracaoMax,
  UEmbarque_cl, UMotivo_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFIntegracaoMaxRoteirizador.BTExportarPedidosClick(Sender: TObject);
var
  linha, wComando, wRegistrosSelecionados: String;
  Result: Boolean;
  i: Integer;
begin
  try
    Result := False;
    //AssignFile(arquivo, 'c:\MaximaSistemas\Integracao.txt '+ FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt');
//    if FileExists('c:\MaximaSistemas\Integracao '+ FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt') then
//      Append(arquivo)
//    else
//      Rewrite(arquivo);

    //EXPORTAÇÃO DE PEDIDOS E ITENS DE PEDIDO
    with DMPedido do
    begin
      if FFiltroPedidosIntegraMax = nil then
        FFiltroPedidosIntegraMax := TFFiltroPedidosIntegraMax.Create(Application);

      if FFiltroPedidosIntegraMax.ShowModal = mrOk then
      begin
        if DMParamSistema.QParamSistemaIND_TIPO_SINCRONIZACAO_MAX.Value = 0 then
        begin
          ExportarAuxiliares(False, 'Pedidos');
          Panel1.Enabled := false;
          Cursor := crHourGlass;
          wRegistrosSelecionados := FFiltroPedidosIntegraMax.ListarSelecionados;
          if wRegistrosSelecionados <> '' then
          begin
            QPedidosIntegraMax.SetVariable('PEDIDO_CAB',wRegistrosSelecionados);
            QPedidosIntegraMax.Open;
          end;

          while not QPedidosIntegraMax.Eof do
          begin
            if QPedidosIntegraMaxIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
              linha := 'PEDC|I'
            else
              linha := 'PEDC|A';
            QPedido.Close;
            QPedido.SetVariable('PK', QPedidosIntegraMaxCOD_PEDIDO_CAB.Value);
            QPedido.Open;
            QSomaPedido.Close;
            QSomaPedido.Open;
            QPedidoItemCons.Close;
            QPedidoItemCons.SetVariable('COD_PEDIDO_CAB', QPedidosIntegraMaxCOD_PEDIDO_CAB.Value);
            QPedidoItemCons.Open;

            linha := linha + '|' + QPedidosIntegraMaxNUM_PEDIDO.Text + '|' + QPedidosIntegraMaxCOD_CADASTRO.Text +
              '|' + QPedidosIntegraMaxDT_EMISSAO.Text + '|' + Bib.TrocaVirgulaPorPonto(FloatToStr(QSomaPedidoSNUM_VOLUMES.Value)) +
              '|' + Bib.TrocaVirgulaPorPonto(FloatToStr(QSomaPedidoSPESO_BRUTO.Value)) +
              '|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',RoundTo(QSomaPedidosval_total_pedido.Value, -2))) +
              '||||||||'+QPedidosIntegraMaxCOD_VENDEDOR.Text+
              '||||' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',RoundTo(QSomaPedidosval_total_pedido.Value, -2))) +
              '|||||'+QPedidosIntegraMaxCOD_FILIAL.Text+'||' +
              IntToStr(QPedidoItemCons.RecordCount) +
              '|||'+ QPedidosIntegraMaxDESC_OBSERVACAO.Value +
              '||||'+QPedidosIntegraMaxDT_ENTREGA.Text+'|||';
            Writeln(arquivo, UTF8Encode(linha));
            Result := True;


            while not QPedidoItemCons.Eof do
            begin
              if QPedidoItemConsIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
                linha := 'PEDI|I'
              else
                linha := 'PEDI|A';
              linha := linha + '|' + QPedidosIntegraMaxNUM_PEDIDO.Text + '|' +QPedidoItemConsCOD_PRODUTO.Text +
                '|' + QPedidoItemConsQT_PEDIDO.Text;
              Writeln(arquivo, UTF8Encode(linha));
              QPedidoItemCons.Next;
            end;
            QPedidosIntegraMax.Next;
          end;
          if QPedidosIntegraMax.RecordCount > 0 then
            with DMOracle do
            begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_PEDIDO_CAB SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
                ' WHERE COD_PEDIDO_CAB IN ('+wRegistrosSelecionados+')';
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;

              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_PEDIDO_ITEM PI SET PI.IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
                ' WHERE  PI.COD_PEDIDO_CAB IN ('+wRegistrosSelecionados+')';
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
              QExecSQL.Close;
              DBCemapa.Commit;
            end;
          Cursor := crDefault;
          if Result then
            ShowMessage('Exportação realizada com sucesso.')
          else
            ShowMessage('Não há notas a serem exportadas.');
          CloseFile(arquivo);
          Cursor := crDefault;
          Panel1.Enabled := True;
        end
        else
        begin
          try
            wRegistrosSelecionados := FFiltroPedidosIntegraMax.ListarSelecionados;
            if wRegistrosSelecionados <> '' then
            begin
              QPedidosIntegraMax.SetVariable('PEDIDO_CAB',wRegistrosSelecionados);
              QPedidosIntegraMax.Open;
            end;
            if QPedidosIntegraMax.RecordCount > 0 then
              with DMOracle do
              begin
                QExecSQL.Close;
                QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_PEDIDO_CAB SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('I') + ', IND_POSICAO_MAX = '+QuotedStr('L') +
                  ' WHERE COD_PEDIDO_CAB IN ('+wRegistrosSelecionados+')';
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;

                QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_PEDIDO_ITEM PI SET PI.IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('I') + ', IND_POSICAO_MAX = '+QuotedStr('L') +
                  ' WHERE  PI.COD_PEDIDO_CAB IN ('+wRegistrosSelecionados+')';
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;
                QExecSQL.Close;
                DBCemapa.Commit;
                ShowMessage('Pedidos exportados com sucesso.');
              end
            else
              ShowMessage('Não há pedidos a serem exportados.');
          except
            on E: Exception do
              begin
                DMOracle.DBCemapa.Rollback;
                MessageDlg('Erro na exportação.' + #13 + #10 +
                  E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      begin
        try
          CloseFile(arquivo);
        except
        end;
        Cursor := crDefault;
        Panel1.Enabled := True;
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na exportação.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;

end;


procedure TFIntegracaoMaxRoteirizador.SubDiretorios(Diretorio: string; var Lista: TStringList);
var  SearchRec: TSearchRec;
begin
	if FindFirst(Diretorio + '*.*', faDirectory, SearchRec) = 0 then
		repeat
			if (SearchRec.Attr and faDirectory = faDirectory) and		 (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
			begin
				Lista.Add(Diretorio + SearchRec.Name + '\');
				SubDiretorios(Diretorio + SearchRec.Name + '\', Lista);
			end;
		until FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
end;

function TFIntegracaoMaxRoteirizador.ExportarAuxiliares(MostrarMensagem: Boolean = True; TipoExportacao: String = ''): Boolean;
var linha, wComando: String;
begin
  try
    Result := false;
    Panel1.Enabled := false;
    Cursor := crHourGlass;
    if not DirectoryExists('c:\MaximaSistemas\') then
      CreateDir('c:\MaximaSistemas\');

    AssignFile(arquivo, 'c:\MaximaSistemas\Integracao ' + TipoExportacao + FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt');
    if FileExists('c:\MaximaSistemas\Integracao '+ TipoExportacao + FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt') then
      Append(arquivo)
    else
    begin
      Rewrite(arquivo);
      ////DISTRIBUIÇÃO PADRÃO
//      Writeln(arquivo, 'DIST|I|1|PADRAO');
//      //PRAÇA PADRÃO
//      Writeln(arquivo, 'PRAC|I|1|PADRAO|||');
//      //SUPERVISOR PADRÃO
//      Writeln(arquivo, 'SUP|I|1|PADRAO|');
//      //REDE PADRÃO
//      Writeln(arquivo, 'REDE|I|1|PADRAO');
    end;

    //EXPORTAÇÃO DE MOTIVOS DE DEVOLUÇÃO
    with DMMotivo do
    begin
      QRMotivo.Close;
      QRMotivo.SQL.Delete(QRMotivo.SQL.Count-1);
      QRMotivo.SQL.Add(' WHERE (TB_MOTIVO.IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR TB_MOTIVO.IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRMotivo.Open;

      while not QRMotivo.Eof do
      begin
        if QRMotivoIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'TDEV|I'
        else
          linha := 'TDEV|A';
        linha := linha + '|' + QRMotivoCOD_MOTIVO.Text + '|' + QRMotivoDESC_MOTIVO.Text;
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRMotivo.Next;
      end;
      if QRMotivo.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_MOTIVO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;

    //EXPORTAÇÃO DE CIDADES
    with DMCidade do
    begin
      QRCidade.Close;
      QRCidade.SQL.Delete(QRCidade.SQL.Count-1);
      QRCidade.SQL.Add('AND (TB_CIDADE.IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR TB_CIDADE.IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRCidade.Open;

      while not QRCidade.Eof do
      begin
        if QRCidadeIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'CIDA|I'
        else
          linha := 'CIDA|A';
        linha := linha + '|' + QRCidadeCOD_CIDADE.Text + '|' + QRCidadeDESC_CIDADE.Text + '|' +
          QRCidadeCOD_ESTADO.Value + '|' +
            DMOracle.BuscaNome('SELECT COD_UF_IBGE FROM TB_ESTADO','COD_ESTADO = '+ QuotedStr(QRCidadeCOD_ESTADO.Text)) +
            QRCidadeCOD_CIDADE_IBGE.Text;    
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRCidade.Next;
      end;
      if QRCidade.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CIDADE SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;

    //EXPORTAÇÃO DE REGIÕES
    with DMRegiao do
    begin
      QRegiaoAll.Close;
      QRegiaoAll.SQL.Delete(QRegiaoAll.SQL.Count-1);
      QRegiaoAll.SQL.Add('WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRegiaoAll.Open;

      while not QRegiaoAll.Eof do
      begin
        if QRegiaoAllIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'REGI|I'
        else
          linha := 'REGI|A';
        linha := linha + '|' + QRegiaoAllCOD_REGIAO.Text + '|' + QRegiaoAllDESC_REGIAO.Text + '|||';
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRegiaoAll.Next;
      end;
      if QRegiaoAll.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_REGIAO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;
    //EXPORTAÇÃO DE FILIAIS
    with DMFilial do
    begin
      QRFilial.Close;
      QRFilial.SQL.Delete(QRFilial.SQL.Count-1);
      QRFilial.SQL.Add('WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRFilial.Open;

      while not QRFilial.Eof do
      begin
        if QRFilialIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'FILI|I'
        else
          linha := 'FILI|A';
        linha := linha + '|' + QRFilialCOD_FILIAL.Text + '|' + QRFilialDESC_FILIAL.Value;
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRFilial.Next;
      end;
      if QRFilial.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_FILIAL SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;
    
    //EXPORTAÇÃO DE VEÍCULOS
    with DMVeiculo do
    begin
      QRVeiculo.Close;
      QRVeiculo.SQL.Delete(QRVeiculo.SQL.Count-1);
      QRVeiculo.SQL.Add('AND (TB_VEICULO.IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR TB_VEICULO.IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRVeiculo.Open;

      while not QRVeiculo.Eof do
      begin
        if QRVeiculoIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'VEIC|I'
        else
          linha := 'VEIC|A';
        linha := linha + '|' + QRVeiculoCOD_VEICULO.Text + '|' + QRVeiculoDESC_MODELO.Text + '|' +
          Bib.LimpaString(Bib.LimpaString(QRVeiculoNUM_PLACA.Value, '-'), ' ') + '|' +
            DMOracle.FastSelect('DESC_FABRICANTE','TB_VEICULO_FABRICANTE','COD_FABRICANTE = '+
            '(SELECT COD_FABRICANTE FROM TB_VEICULO_MODELO WHERE COD_MODELO = '+
            QRVeiculoCOD_MODELO.Text + ')') +'||' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',QRVeiculoNUM_VOLUME_MAXIMO.Value)) +
            '|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00', QRVeiculoNUM_PESO_MAXIMO.Value)) +
            '|||' + Bib.ift(Bib.LimpaNumero(QRVeiculoCNPJ_FILIAL.Value) = Bib.LimpaNumero(QRVeiculoCNPJ_CPF_PROPRIETARIO.Value), 'S', 'N') +
            '|'+ QRVeiculoCOD_FILIAL.Text +'|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',QRVeiculoNUM_ALTURA.Value)) +
            '|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',QRVeiculoNUM_LARGURA.Value)) +
            '|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',QRVeiculoNUM_COMPRIMENTO.Value)) +
            '||||' + QRVeiculoCOD_ESTADO.Value + '|' + Copy(Trim(QRVeiculoDESC_CIDADE.Value),0, 30);
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRVeiculo.Next;
      end;
      if QRVeiculo.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_VEICULO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;  
    end;
    //EXPORTAÇÃO DE MOTORISTAS/EMPREGADOS
    with DMCadastro do
    begin
      QCadastroCons.Close;
      QCadastroCons.SQL.Delete(QCadastroCons.SQL.Count-1);
      QCadastroCons.SQL.Add('AND (TB_CADASTRO.COD_TIPO_CADASTRO = 6 OR TB_CADASTRO.COD_TIPO_CADASTRO = 7) AND TB_CADASTRO.DT_CANCELAMENTO IS NULL AND (IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QCadastroCons.Open;

      while not QCadastroCons.Eof do
      begin
        if QCadastroConsIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'EMPR|I'
        else
          linha := 'EMPR|A';
        linha := linha + '|' + QCadastroConsCOD_CADASTRO.Text + '|' + QCadastroConsNOME.Value +
          '||' + QCadastroConsDESC_FANTASIA.Value +'|' + QCadastroConsDESC_TELEFONE.Value + '|' +
          QCadastroConsDESC_CELULAR.Value + '|1|'+
          Bib.ift(QCadastroConsCOD_TIPO_CADASTRO.Value = 6, 'F', 'M') +
          '|||'+ QCadastroConsNUM_CGC_CPF.Value + '|A|';
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QCadastroCons.Next;
      end;
      if QCadastroCons.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CADASTRO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (COD_TIPO_CADASTRO = 6 OR COD_TIPO_CADASTRO = 7) AND (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;  
    end;

    //EXPORTAÇÃO DE ATIVIDADE/RAMO DOS CLIENTES
    with DMRamo do
    begin
      QRRamo.Close;
      QRRamo.SQL.Delete(QRRamo.SQL.Count-1);
      QRRamo.SQL.Add('WHERE  (TB_RAMO.IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR TB_RAMO.IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QRRamo.Open;

      while not QRRamo.Eof do
      begin
        if QRRamoIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'ATIV|I'
        else
          linha := 'ATIV|A';
        linha := linha + '|' + QRRamoCOD_RAMO.Text + '|' + QRRamoDESC_RAMO.Value;
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QRRamo.Next;
      end;
      if QRRamo.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_RAMO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;  
    end;
    //EXPORTAÇÃO DE VENDEDORES
    with DMVendedor do
    begin
      QVendedorCons.Close;
      QVendedorCons.SQL.Delete(QVendedorCons.SQL.Count-1);
      QVendedorCons.SQL.Add('AND  (IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QVendedorCons.Open;

      while not QVendedorCons.Eof do
      begin
        if QVendedorConsIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'USUR|I'
        else
          linha := 'USUR|A';
        linha := linha + '|' + QVendedorConsCOD_VENDEDOR.Text + '|' + QVendedorConsNOME.Value + '||' +
        QVendedorConsDESC_TELEFONE.Value + '||';
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QVendedorCons.Next;
      end;

      if QVendedorCons.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_VENDEDOR SET IND_SINC_MAX_ROTEIRIZADOR = ''S''' +
            ' WHERE (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;

    //EXPORTAÇÃO DE PRODUTOS
    with DMProduto do
    begin
      QProdutoCons.Close;
      QProdutoCons.SQL.Delete(QProdutoCons.SQL.Count-1);
      QProdutoCons.SQL.Add('AND TB_PRODUTO.IND_SITUACAO = ''ATIVO'' AND TB_PRODUTO.IND_TIPO_PRODUTO = ''COMERCIAL'' AND  (TB_PRODUTO.IND_SINC_MAX_ROTEIRIZADOR = ''I'' OR TB_PRODUTO.IND_SINC_MAX_ROTEIRIZADOR = ''A'')');
      QProdutoCons.Open;

      while not QProdutoCons.Eof do
      begin
        if QProdutoConsIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'PROD|I'
        else
          linha := 'PROD|A';
        linha := linha + '|' + QProdutoConsCOD_PRODUTO.Text + '|' + QProdutoConsDESC_PRODUTO.Value +
          '|' + QProdutoConsDESC_UNIDADE.Value + '|' + QProdutoConsNUM_VOLUMES.Text;
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QProdutoCons.Next;
      end;
      if QProdutoCons.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_PRODUTO SET IND_SINC_MAX_ROTEIRIZADOR = ''S'''+
            ' WHERE IND_SITUACAO = ''ATIVO'' AND IND_TIPO_PRODUTO = ''COMERCIAL'' AND '+
            ' (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;
    

    //EXPORTAÇÃO DE CLIENTES
    with DMCadastro do
    begin
      QCadastroCons.Close;
      QCadastroCons.SQL.Delete(QCadastroCons.SQL.Count - 1);
      wComando := ' AND TB_CADASTRO.COD_TIPO_CADASTRO < 4 AND TB_CADASTRO.DT_CANCELAMENTO IS NULL AND (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')' +
            ' AND TB_CADASTRO.DESC_CEP IS NOT NULL AND TB_CADASTRO.COD_CIDADE IS NOT NULL AND TB_CADASTRO.DESC_ENDERECO IS NOT NULL AND TB_CADASTRO.DESC_BAIRRO IS NOT NULL AND TB_CADASTRO.NUM_CGC_CPF IS NOT NULL';
      QCadastroCons.SQL.Add(wComando);
      QCadastroCons.Open;

      while not QCadastroCons.Eof do
      begin
        if QCadastroConsIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
          linha := 'CLIE|I'
        else
          linha := 'CLIE|A';

        linha := linha + '|' + QCadastroConsCOD_CADASTRO.Text + '|' + QCadastroConsNOME.Value +
          '|' + Bib.ift(QCadastroConsDESC_FANTASIA.Value = '', QCadastroConsNOME.Value, QCadastroConsDESC_FANTASIA.Value) +
          '|' + Bib.LimpaNumero(QCadastroConsNUM_CGC_CPF.Value) +
          '|' + bib.RemoveNumEndereco(QCadastroConsDESC_ENDERECO.Value,bib.NumEndereco(QCadastroConsDESC_ENDERECO.Value)) +
          '|' + QCadastroConsDESC_COMPLEMENTO.Value +
          '|'+ bib.NumEndereco(QCadastroConsDESC_ENDERECO.Value) +'|' + Copy(QCadastroConsDESC_BAIRRO.Value,1,40) +
          '|' + QCadastroConsDESC_CIDADE.Value +
          '|' + QCadastroConsCOD_ESTADO.Value + '|' + Bib.LimpaNumero(QCadastroConsDESC_CEP.Value) +
          '|||||' + QCadastroConsDESC_TELEFONE.Value + '|' + QCadastroConsCOD_RAMO.Text +
          '|||' + Copy(QCadastroConsDESC_OBS.Value,1,40) +
          '||||'+QCadastroConsCOD_CIDADE.Text+'||'+QCadastroConsCOD_VENDEDOR.Text;
        Writeln(arquivo, UTF8Encode(linha));
        Result := True;
        QCadastroCons.Next;
      end;
      if QCadastroCons.RecordCount > 0 then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CADASTRO SET IND_SINC_MAX_ROTEIRIZADOR = '+QuotedStr('S') +
            ' WHERE TB_CADASTRO.COD_TIPO_CADASTRO < 4 AND TB_CADASTRO.DT_CANCELAMENTO IS NULL AND (IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
            ' OR IND_SINC_MAX_ROTEIRIZADOR = ''A'')' +
            ' AND TB_CADASTRO.DESC_CEP IS NOT NULL AND TB_CADASTRO.COD_CIDADE IS NOT NULL AND TB_CADASTRO.DESC_ENDERECO IS NOT NULL AND TB_CADASTRO.DESC_BAIRRO IS NOT NULL AND TB_CADASTRO.NUM_CGC_CPF IS NOT NULL';
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          
          QExecSQL.Close;
          DBCemapa.Commit;
        end;
    end;  


    Cursor := crDefault;
    if MostrarMensagem and Result then
    begin
      CloseFile(arquivo);
      ShowMessage('Exportação realizada com sucesso.')
    end
    else if MostrarMensagem then
    begin
      CloseFile(arquivo);
      ShowMessage('Nada a exportar.');
    end;
    Panel1.Enabled := True;
  except
    on E: Exception do
      begin
        try
          CloseFile(arquivo);
        except
        end;
        Cursor := crDefault;
        Panel1.Enabled := True;
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na exportação de clientes.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;

end;

procedure TFIntegracaoMaxRoteirizador.BTExportarAuxiliaresClick(
  Sender: TObject);
begin
  ExportarAuxiliares;
end;

procedure TFIntegracaoMaxRoteirizador.BTExportarNotasClick(
  Sender: TObject);
var
  linha, wComando, wRegistrosSelecionados: String;
  Result: Boolean;
  i: Integer;
begin
  try
    Result := False;
    //AssignFile(arquivo, 'c:\MaximaSistemas\Integracao '+ FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt');
//    if FileExists('c:\MaximaSistemas\Integracao '+ FormatDateTime('dd-MM-yyyy hhmm', now)+'.txt') then
//      Append(arquivo)
//    else
//      Rewrite(arquivo);
    
    //EXPORTAÇÃO DE NOTAS E ITENS DE NOTAS
    with DMNotaSaida do
    begin
      if FFiltroNotasIntegraMax = nil then
        FFiltroNotasIntegraMax := TFFiltroNotasIntegraMax.Create(Application);
            
      if FFiltroNotasIntegraMax.ShowModal = mrOk then
      begin
        if DMParamSistema.QParamSistemaIND_TIPO_SINCRONIZACAO_MAX.Value = 0 then
        begin
          ExportarAuxiliares(false, 'NotasFiscais');
          Panel1.Enabled := false;
          Cursor := crHourGlass;
          wRegistrosSelecionados := FFiltroNotasIntegraMax.ListarSelecionados;
          if wRegistrosSelecionados <> '' then
          begin
            QNotasIntegracaoMax.SetVariable('NOTA_CAB',wRegistrosSelecionados);
            QNotasIntegracaoMax.Open;
          end;


          while not QNotasIntegracaoMax.Eof do
          begin
            if QNotasIntegracaoMaxIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
              linha := 'NFSA|I'
            else
              linha := 'NFSA|A';
            QNotaSaida.Close;
            QNotaSaida.SetVariable('PK',QNotasIntegracaoMaxCOD_NOTA_CAB.Value);
            QNotaSaida.Open;
            QSomaItemNota.Close;
            QSomaItemNota.Open;
            QItemNotasIntegraMax.Close;
            QItemNotasIntegraMax.SetVariable('COD_NOTA_CAB', QNotasIntegracaoMaxCOD_NOTA_CAB.Value);
            QItemNotasIntegraMax.Open;
            linha := linha + '|' + QNotasIntegracaoMaxNUM_NOTA.Text + '|' + QNotasIntegracaoMaxDT_EMISSAO.Text +
              '|' + Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',RoundTo(QSomaItemNotasval_total_nota.Value, -2))) +
              '|' + QNotasIntegracaoMaxCOD_CADASTRO.Text +
              '|'+ QNotasIntegracaoMaxDT_PREV_RETORNO.Text + '|'+ QNotaSaidaCOD_FILIAL.Text +
              '|' +Bib.TrocaVirgulaPorPonto(bib.ift(not QNotaSaidaNUM_PESO_BRUTO.IsNull,
                  FloatToStr(QNotaSaidaNUM_PESO_BRUTO.Value), FloatToStr(DMNfe.PesoBruto))) + '|' +
                  Bib.TrocaVirgulaPorPonto(FloatToStr(Trunc(Bib.ift(DMNfe.Volumes > 0, DMNfe.Volumes, QSomaItemNotaSQT_TOTAL.Value)))) +
              '|'+ QNotasIntegracaoMaxNUM_EMBARQUE.Text +'|'+
              QNotaSaidaNUM_PEDIDO.Text + '|||' + QNotaSaidaOBS.Value +
              Bib.ift(QNotaSaidaDESC_OBS_CORPO_NOTA.Value = '','', ' ' + QNotaSaidaDESC_OBS_CORPO_NOTA.Value) +
              '|' + IntToStr(QItemNotasIntegraMax.RecordCount)+ '||' + QNotasIntegracaoMaxNUM_SEQUENCIAL.Text +
              '|'+ QNotaSaidaCOD_VENDEDOR.Text + '||' + QNotasIntegracaoMaxDT_EMISSAO.Text;
            Writeln(arquivo, UTF8Encode(linha));
            Result := True;
            if QNotasIntegracaoMaxIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
              linha := 'NFXM|I'
            else
              linha := 'NFXM|A';
            linha := linha + '|' + QNotasIntegracaoMaxNUM_NOTA.Text + '|' + Bib.LimpaNumero(QNotasIntegracaoMaxDESC_CHAVE_ACESSO.Text);
            Writeln(arquivo, UTF8Encode(linha));

            while not QItemNotasIntegraMax.Eof do
            begin
              if QItemNotasIntegraMaxIND_SINC_MAX_ROTEIRIZADOR.Value = 'I' then
                linha := 'NFIT|I'
              else
                linha := 'NFIT|A';
              linha := linha + '|' + QItemNotasIntegraMaxCOD_NOTA_ITEM.Text + '|' +QItemNotasIntegraMaxCOD_PRODUTO.Text +
                '|' + QNotaSaidaNUM_NOTA.Text + '|' +
                 IntToStr(QItemNotasIntegraMaxQT_QUANTIDADE.AsInteger) + '|' +
                Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',QItemNotasIntegraMaxVAL_UNITARIO.Value)) + '|'+
                QNotasIntegracaoMaxNUM_EMBARQUE.Text;
              Writeln(arquivo, UTF8Encode(linha));

              QItemNotasIntegraMax.Next;
            end;
            QNotasIntegracaoMax.Next;
          end;
          if QNotasIntegracaoMax.RecordCount > 0 then
            with DMOracle do
            begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_NOTA_CAB SET IND_SINC_MAX_ROTEIRIZADOR = ''S''' +
                ' WHERE COD_NOTA_CAB IN ('+ wRegistrosSelecionados+')';
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;

              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_NOTA_ITEM PI SET PI.IND_SINC_MAX_ROTEIRIZADOR = ''S''' +
                ' WHERE COD_NOTA_CAB IN ('+ wRegistrosSelecionados+')';
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
              QExecSQL.Close;
              DBCemapa.Commit;
            end;

          Cursor := crDefault;
          if Result then
            ShowMessage('Exportação realizada com sucesso.')
          else
            ShowMessage('Não há notas a serem exportadas.');
          CloseFile(arquivo);
          Cursor := crDefault;
          Panel1.Enabled := True;
        end
        else
        begin
          try
            wRegistrosSelecionados := FFiltroNotasIntegraMax.ListarSelecionados;
            if wRegistrosSelecionados <> '' then
            begin
              QNotasIntegracaoMax.SetVariable('NOTA_CAB',wRegistrosSelecionados);
              QNotasIntegracaoMax.Open;
            end;
            if QNotasIntegracaoMax.RecordCount > 0 then
              with DMOracle do
              begin
                QExecSQL.Close;
                QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_NOTA_CAB SET IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
                  ' WHERE COD_NOTA_CAB IN ('+ wRegistrosSelecionados+')';
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;

                QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_NF_ELETRONICA SET IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
                  ' WHERE COD_NOTA_CAB IN ('+ wRegistrosSelecionados+')';
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;

                QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_NOTA_ITEM PI SET PI.IND_SINC_MAX_ROTEIRIZADOR = ''I''' +
                  ' WHERE COD_NOTA_CAB IN ('+ wRegistrosSelecionados+')';
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;
                QExecSQL.Close;
                DBCemapa.Commit;
                ShowMessage('Notas exportadas com sucesso.');
              end
            else
              ShowMessage('Não há notas a serem exportadas.');
          except
            on E: Exception do
              begin
                DMOracle.DBCemapa.Rollback;
                MessageDlg('Erro na exportação.' + #13 + #10 +
                  E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      begin
        try
          CloseFile(arquivo);
        except
        end;
        Cursor := crDefault;
        Panel1.Enabled := True;
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Erro na exportação.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;
end;

procedure TFIntegracaoMaxRoteirizador.BTImportarRetornoClick(
  Sender: TObject);
var
  linha, wComando, wCodEmbarque, wCodPedidoCab, wPedidosEmbarque, wNumEmbarque: String;
  arquivo: TextFile;
  Result: Boolean;
  SR: TSearchRec;
begin
  if FindFirst('c:\RetornoIntegracao\*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      try
        if (SR.Attr <> faDirectory) then
        begin
          AssignFile(arquivo, 'c:\RetornoIntegracao\'+SR.Name);
          Reset(arquivo);
          DMEmbarque.QEmbarque.Open;
          DMOracle.DBCemapa.StartTransaction;
          wNumEmbarque := '';
          while not Eof(arquivo) do
          begin
            Readln(arquivo, linha);

            with DMEmbarque do
            begin
              if wNumEmbarque <> Copy(linha,1,8) then
              begin
                //if wNumEmbarque <> '' then
                  //with DMOracle do
//                  begin
//                    QExecSQL.Close;
//                    QExecSQL.SQL.Clear;
//                    wComando := 'DELETE FROM TB_EMBARQUE_ITEM WHERE COD_PEDIDO_CAB NOT IN ' +
//                      '('+ LeftStr(wPedidosEmbarque, length(wPedidosEmbarque) - 1) + ') AND COD_EMBARQUE = ' +
//                      QEmbarqueCOD_EMBARQUE.Text;
//                    QExecSQL.SQL.Add(wComando);
//                    QExecSQL.ExecSQL;
//                  end;
                wPedidosEmbarque := '';
                wNumEmbarque := Copy(linha,1,8);
                wCodEmbarque := '';
                //wCodEmbarque := DMOracle.BuscaNome('SELECT MAX(COD_EMBARQUE) FROM TB_EMBARQUE','NUM_EMBARQUE = ' +
//                  wNumEmbarque);
              end;
              if wCodEmbarque = '' then
              begin
                QEmbarque.Insert;
                QEmbarqueDT_EMBARQUE.Value := Today;
                wCodEmbarque := QEmbarqueCOD_EMBARQUE.Text;
                QEmbarqueNUM_EMBARQUE.Text := wNumEmbarque;
                QEmbarqueDT_PREV_RETORNO.Text := Copy(linha,31,2)+'/'+ Copy(linha,33,2)+'/20'+Copy(linha,35,2);
                QEmbarqueDESC_PLACA.Value := Copy(linha,37,7);
                QEmbarqueDESC_DESTINO_FRETE.Value := Trim(Copy(linha,48,20));
                QEmbarqueDESC_OBS.Value := Trim(Copy(linha,48,20));
                QEmbarque.Post;
              end
              else
              begin
                QEmbarque.Close;
                QEmbarque.SetVariable('PK', wCodEmbarque);
                QEmbarque.Open;
              end;
              QEmbarque.Edit;
              wCodPedidoCab := DMOracle.BuscaNome('SELECT MAX(COD_PEDIDO_CAB) FROM TB_PEDIDO_CAB',
                'NUM_PEDIDO = ' + Copy(linha,9,10) + ' AND COD_CADASTRO = ' + Copy(linha, 19, 9));
              if wCodPedidoCab <> '' then
              begin
                QEmbarqueItem.DisableControls;
                QEmbarqueItem.AutoCalcFields := False;
                if QEmbarqueItem.Locate('COD_PEDIDO_CAB',wCodPedidoCab,[]) then
                  QEmbarqueItem.Edit
                else
                  QEmbarqueItem.Insert;
                QEmbarqueItem.EnableControls;
                QEmbarqueItem.AutoCalcFields := True;
                QEmbarqueItemCOD_EMBARQUE.Value := QEmbarqueCOD_EMBARQUE.Value;
                QEmbarqueItemCOD_PEDIDO_CAB.Text := wCodPedidoCab;
                wPedidosEmbarque := wPedidosEmbarque + wCodPedidoCab + ',';
                QEmbarqueItemNUM_SEQUENCIAL.Text := Trim(Copy(linha, 28,3));
                QEmbarqueItem.Post;
                QEmbarque.Post;
              end;
            end;
          end;
          //if wPedidosEmbarque <> '' then
//            with DMOracle do
//            begin
//              QExecSQL.Close;
//              QExecSQL.SQL.Clear;
//              wComando := 'DELETE FROM TB_EMBARQUE_ITEM WHERE COD_PEDIDO_CAB NOT IN ' +
//                '('+ LeftStr(wPedidosEmbarque, length(wPedidosEmbarque) - 1) + ') AND COD_EMBARQUE = ' +
//                DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
//              QExecSQL.SQL.Add(wComando);
//              QExecSQL.ExecSQL;
//            end;
          DMOracle.DBCemapa.Commit;
          CloseFile(arquivo);
          if not DirectoryExists('c:\RetornoIntegracao\sincronizados\') then
            CreateDir('c:\RetornoIntegracao\sincronizados\');
          MoveFile(PAnsiChar('c:\RetornoIntegracao\'+SR.Name), PAnsiChar('c:\RetornoIntegracao\sincronizados\'+SR.Name));
          DeleteFile('c:\RetornoIntegracao\'+SR.Name);
        end;
      except
        on E: Exception do
          begin
            DMEmbarque.QEmbarque.Cancel;
            DMEmbarque.QEmbarqueItem.Cancel;
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Erro na importação de carregamentos.' + #13 + #10 +
                E.Message, mtError, [mbOK], 0);
          end;
      end;
      DMEmbarque.QEmbarqueItem.Close;;
      DMEmbarque.QEmbarque.Close;
    until FindNext(SR) <> 0;
    ShowMessage('Importação realizada com sucesso.');
  end
  else
    ShowMessage('Não existem arquivo s de carregamentos a serem importados.');
end;

procedure TFIntegracaoMaxRoteirizador.BitBtn1Click(Sender: TObject);
begin
  ExportaFornecedores;
end;

procedure TFIntegracaoMaxRoteirizador.ExportaFornecedores;
var
  S : String;
  F : TextFile;
  wSequencia : Integer;
  sList : TStringList;
  nCampo : integer;
  cLinha, wNumero :string;
  planilha: Variant;
  Excel : variant ;
begin
  with DMNotaSaida do
  begin
    QExpFornecedor.Close;
    QExpFornecedor.Open;
    SList := Tstringlist.Create;
    Clinha :='';
    for NCampo := 0 to QExpFornecedor.Fields.Count-1 do
      CLinha := CLinha+QExpFornecedor.Fields[NCampo].DisplayLabel+';';
    SList.Add(CLinha);
    QExpFornecedor.First;
    while not QExpFornecedor.Eof do
    begin
      sList.Add(
         QExpFornecedorFORN_TIPO.Value
         + ';' + QExpFornecedorFORN_CPF_CNPJ.Value
         + ';' + QExpFornecedorFORN_IE.Value
         + ';' + QExpFornecedorFORN_NOME_RAZAO.Value
         + ';' + QExpFornecedorFORN_NOME_FANTASIA.Value
         + ';' + QExpFornecedorFORN_DATA_NASCIMENTO_ABERTURA.AsString
         + ';' + QExpFornecedorFORN_EMAIL.Value
         + ';' + QExpFornecedorFORN_FONE.Value
         + ';' + QExpFornecedorFORN_FONE_EXTRA.Value
         + ';' + QExpFornecedorFORN_CONTATO.Value
         + ';' + QExpFornecedorFORN_ENDERECO.Value
         + ';' + bib.NumEndereco(QExpFornecedorFORN_ENDERECO.AsString)
         + ';' + QExpFornecedorFORN_COMPLEMENTO.Value
         + ';' + QExpFornecedorFORN_CEP.Value
         + ';' + QExpFornecedorFORN_BAIRRO.Value
         + ';' + QExpFornecedorPAIS_COD.AsString
         + ';' + QExpFornecedorUF.Value
         + ';' + QExpFornecedorCID_NOME.Value
         + ';' + QExpFornecedorFORN_PRODUTO_SERVICO.Value
         + ';' + QExpFornecedorFORN_OBSERVACAO.Value
         + ';' + QExpFornecedorFORN_CRITICO.AsString
         + ';' + QExpFornecedorFORN_INTERNACIONAL.AsString
         + ';' + QExpFornecedorFORN_COD_EXTERNO.Value
         + ';' + FormatDateTime('dd/MM/yyyy',QExpFornecedorFORN_DATA_CADASTRO.Value)
         + ';' + QExpFornecedorFORN_ATIVO.AsString
         + ';' + QExpFornecedorTIPO_NOME.Value
         + ';' + QExpFornecedorTIPO_OQUE_FORNECE.Value
         + ';' + QExpFornecedorTIPO_EXIGE_QUALIFICACAO.Text
         +';' );
      QExpFornecedor.Next;

    {  Clinha :='';
      for NCampo := 0 to QExpFornecedor.Fields.Count-1 do
        CLinha := CLinha+QExpFornecedor.Fields[NCampo].DisplayText+';';
      SList.Add(CLinha);
      QExpFornecedor.Next;}
    end;
    SaveDialog.FileName := 'Fornecedores';
    if SaveDialog.Execute then
    begin
      sList.SaveToFile(SaveDialog.FileName);
      ShowMessage('Arquivo exportado com sucesso!');
    end
    else
      ShowMessage('Arquivo não gerado. Cancelado pelo usuário!');
  end;
end;

procedure TFIntegracaoMaxRoteirizador.ExportaClientes;
var
  S : String;
  F : TextFile;
  wSequencia : Integer;
  sList : TStringList;
  nCampo : integer;
  cLinha, wNumero :string;
  planilha: Variant;
  Excel : variant ;
begin
  with DMNotaSaida do
  begin
    QExpCliente.Close;
    QExpCliente.Open;
    SList := Tstringlist.Create;
    Clinha :='';
    for NCampo := 0 to QExpCliente.Fields.Count-1 do
      CLinha := CLinha+QExpCliente.Fields[NCampo].DisplayLabel+';';
    SList.Add(CLinha);
    QExpCliente.First;
    while not QExpCliente.Eof do
    begin
      sList.Add(
         QExpClienteCLI_TIPO.Value
         + ';' + QExpClienteCLI_CPF_CNPJ.Value
         + ';' + QExpClienteCLI_RG_IE.Value
         + ';' + QExpClienteCLI_NOME_RAZAO.Value
         + ';' + QExpClienteCLI_NOME_FANTASIA.Value
         + ';' + QExpClienteCLI_DATA_NASCIMENTO_ABERTURA.AsString
         + ';' + QExpClienteCLI_NOME_REPRESENTANTE.Value
         + ';' + QExpClienteCLI_CPF_REPRESENTANTE.Value
         + ';' + QExpClienteCLI_ENDERECO.Value
         + ';' + bib.NumEndereco(QExpClienteCLI_ENDERECO.AsString)
         + ';' + QExpClienteCLI_COMPLEMENTO.Value
         + ';' + QExpClienteCLI_CEP.Value
         + ';' + QExpClienteCLI_BAIRRO.Value
         + ';' + QExpClientePAIS_COD.AsString
         + ';' + QExpClienteUF.Value
         + ';' + QExpClienteCID_NOME.Value
         + ';' + QExpClienteCLI_TELEFONE.Value
         + ';' + QExpClienteCLI_TELEFONE_EXTRA.Value
         + ';' + QExpClienteCLI_CONTATO.AsString
         + ';' + QExpClienteCLI_EMAIL.Value
         + ';' + QExpClienteCLI_OBSERVACAO.Value
         + ';' + QExpClienteCLI_ATIVO.AsString
         + ';' );
      QExpCliente.Next;

    {  Clinha :='';
      for NCampo := 0 to QExpFornecedor.Fields.Count-1 do
        CLinha := CLinha+QExpFornecedor.Fields[NCampo].DisplayText+';';
      SList.Add(CLinha);
      QExpFornecedor.Next;}
    end;
    SaveDialog.FileName := 'Clientes';
    if SaveDialog.Execute then
    begin
      sList.SaveToFile(SaveDialog.FileName);
      ShowMessage('Arquivo exportado com sucesso!');
    end
    else
      ShowMessage('Arquivo não gerado. Cancelado pelo usuário!');
  end;
end;

procedure TFIntegracaoMaxRoteirizador.BitBtn2Click(Sender: TObject);
begin
  ExportaClientes;
end;

procedure TFIntegracaoMaxRoteirizador.ExportaUsuarios;
var
  S : String;
  F : TextFile;
  wSequencia : Integer;
  sList : TStringList;
  nCampo : integer;
  cLinha, wNumero :string;
  planilha: Variant;
  Excel : variant ;
  wSenha: String;
begin
  with DMNotaSaida do
  begin
    QExpUsuario.Close;
    QExpUsuario.Open;
    SList := Tstringlist.Create;
    Clinha :='';
    for NCampo := 0 to QExpUsuario.Fields.Count-1 do
      CLinha := CLinha+QExpUsuario.Fields[NCampo].DisplayLabel+';';
    SList.Add(CLinha);
    QExpUsuario.First;
    while not QExpUsuario.Eof do
    begin
      wSenha := bib.Decode(QExpUsuarioADM_SENHA.Value);
      wSenha := bib.GetHashStringMD5(Trim(wSenha));
      sList.Add(
         QExpUsuarioADM_CPF.Value
         + ';' + QExpUsuarioADM_CHAVE_INTEGRACAO.Value
         + ';' + QExpUsuarioADM_NOME.Value
         + ';' + QExpUsuarioADM_EMAIL.Value
         + ';' + QExpUsuarioADM_SIT.AsString
         + ';' + QExpUsuarioNIVEL_COD.AsString
         + ';' + QExpUsuarioADM_MATRICULA.AsString
         + ';' + QExpUsuarioADM_LOGIN.Value
         + ';' + trim(wSenha) //QExpUsuarioADM_SENHA.Value
         + ';' + QExpUsuarioADM_DATA_ADMISSAO.Value
         + ';' + QExpUsuarioADM_DATA_DESLIGAMENTO.Value
         + ';' + QExpUsuarioTURNO_COD.AsString
         + ';' + QExpUsuarioADM_CARGA_HORARIO.Value
         + ';' + QExpUsuarioADM_SEXO.AsString
         + ';' + QExpUsuarioADM_RG.Value
         + ';' + QExpUsuarioADM_DATA_NASCIMENTO.Value
         + ';' + QExpUsuarioADM_CTPS.Value
         + ';' + QExpUsuarioADM_PIS.Value
         + ';' + QExpUsuarioADM_CBO.AsString
         + ';' + QExpUsuarioADM_TITULO_ELEITOR.Value
         + ';' + QExpUsuarioADM_TEM_PLANO_SAUDE.AsString
         + ';' + QExpUsuarioADM_PLANO_SAUDE.AsString
         + ';' + QExpUsuarioADM_CEP.AsString
         + ';' + QExpUsuarioADM_ENDERECO.AsString
         + ';' + QExpUsuarioPAIS_COD.AsString
         + ';' + QExpUsuarioUF.Value
         + ';' + QExpUsuarioCID_NOME.Value
         + ';' + QExpUsuarioADM_FONE_RESIDENCIAL.Value
         + ';' + QExpUsuarioADM_FONE_CELULAR.Value
         + ';' + QExpUsuarioADM_FONE_EMERGENCIAL.Value
         + ';' + QExpUsuarioADM_BRIGADA.Value
         + ';' + QExpUsuarioADM_CIPA.Value
         + ';' + QExpUsuarioADM_INSPETOR.Value
         + ';' + QExpUsuarioADM_AUDITOR.Value
         );
      QExpUsuario.Next;

    {  Clinha :='';
      for NCampo := 0 to QExpFornecedor.Fields.Count-1 do
        CLinha := CLinha+QExpFornecedor.Fields[NCampo].DisplayText+';';
      SList.Add(CLinha);
      QExpFornecedor.Next;}
    end;
    SaveDialog.FileName := 'Usuarios';
    if SaveDialog.Execute then
    begin
      sList.SaveToFile(SaveDialog.FileName);
      ShowMessage('Arquivo exportado com sucesso!');
    end
    else
      ShowMessage('Arquivo não gerado. Cancelado pelo usuário!');
  end;
end;


procedure TFIntegracaoMaxRoteirizador.BitBtn3Click(Sender: TObject);
begin
  ExportaUsuarios
end;

end.
